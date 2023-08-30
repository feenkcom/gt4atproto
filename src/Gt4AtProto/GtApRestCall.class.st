Class {
	#name : #GtApRestCall,
	#superclass : #ZnJSONRestCall,
	#instVars : [
		'requestBody'
	],
	#category : #'Gt4AtProto-RestCall'
}

{ #category : #accessing }
GtApRestCall class >> allowedMethods [
	^ #()
]

{ #category : #accessing }
GtApRestCall class >> endpointName [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApRestCall class >> errors [
	^ {}
]

{ #category : #'gt - extensions' }
GtApRestCall class >> gtParametersFor: aView [
	<gtView>
	<gtClassView>
	self isAbstract ifTrue: [ ^ aView empty ].

	^ aView columnedList
		title: 'REST parameters';
		items: [ self parameters ];
		column: 'Index'
			text: [ :_ :anIndex | anIndex ]
			width: 40;
		column: 'Name' text: #name;
		column: 'Type'
			text: [ :aParameter | aParameter type ifNotNil: #asClassName ]
			width: 70;
		column: 'Required'
			text: [ :aParameter | 
				| aText |
				aText := aParameter isRequired asRopedText.
				aParameter isRequired
					ifTrue: [ aText ]
					ifFalse: [ aText foreground: BrGlamorousColors disabledButtonTextColor ].
				aText ]
			width: 70
]

{ #category : #accessing }
GtApRestCall class >> isAbstract [
	^ self hasAbstractMethods
]

{ #category : #accessing }
GtApRestCall class >> isExample [
	^ false
]

{ #category : #accessing }
GtApRestCall class >> match: request [
	| aResult requestMethod |
	aResult := super match: request.
	aResult ifNil: [ ^ nil ].
	requestMethod := request method asLowercase asSymbol.
	^ (self allowedMethods anySatisfy: [ :aHttpMethod | 
			requestMethod = aHttpMethod asLowercase asSymbol ])
				ifTrue: [ aResult ]
				ifFalse: [ nil ]
]

{ #category : #accessing }
GtApRestCall class >> modelClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApRestCall class >> parameters [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApRestCall >> badRequest: aRequest withMessage: aString [
	| aResponse |
	aResponse := ZnResponse
			badRequest: aRequest
			entity: (ZnEntity json: '{"error": "BadRequest", "message": "' , aString , '"}').

	self response: aResponse.

	^ aResponse
]

{ #category : #accessing }
GtApRestCall >> notFound: aRequest withMessage: aString [
	| aResponse |
	aResponse := ZnResponse
			notFound: aRequest
			entity: (ZnEntity json: '{"error": "NotFound", "message": "' , aString , '"}').

	self response: aResponse.

	^ aResponse
]

{ #category : #accessing }
GtApRestCall >> requestBody [
	^ requestBody
]

{ #category : #accessing }
GtApRestCall >> requestBody: anObject [
	requestBody := anObject
]

{ #category : #accessing }
GtApRestCall >> validateParameters [
	self class parameters isEmpty
		ifTrue: [ self requestBody: {} asDictionary.
			^ true ].

	self request method = #POST
		ifTrue: [ self request hasEntity
				ifFalse: [ self badRequest: request withMessage: 'Request body was empty'.
					^ false ].

			self request entity contentType = ZnMimeType applicationJson
				ifFalse: [ self badRequest: request withMessage: 'Request body must be JSON'.
					^ false ].

			[ self requestBody: (STONJSON fromString: self request entity) ]
				on: Error
				do: [ self badRequest: request withMessage: 'Request body could not be parsed'.
					^ false ].

			self class parameters
				do: [ :aParameter | 
					(aParameter isRequired
						and: [ (self requestBody includesKey: aParameter name) not ])
						ifTrue: [ self
								badRequest: request
								withMessage: 'Request body is missing the required parameter ' , aParameter name.
							^ false ] ] ]
		ifFalse: [ | body |
			body := {} asDictionary.
			self class parameters
				do: [ :aParameter | 
					| aValue |
					aValue := self request url
							queryAt: aParameter name
							ifAbsent: [ aParameter isRequired
									ifTrue: [ self
											badRequest: request
											withMessage: 'Request is missing the required parameter ' , aParameter name.
										^ false ].
								nil ].
					aValue ifNotNil: [ body at: aParameter name put: aValue ] ].
			self requestBody: body ].
	^ true
]
