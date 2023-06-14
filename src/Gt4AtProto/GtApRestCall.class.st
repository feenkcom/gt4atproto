Class {
	#name : #GtApRestCall,
	#superclass : #ZnJSONRestCall,
	#instVars : [
		'requestBody'
	],
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApRestCall class >> allowedMethods [
	^ #()
]

{ #category : #accessing }
GtApRestCall class >> errors [
	^ {}
]

{ #category : #accessing }
GtApRestCall class >> isAbstract [
	^ self hasAbstractMethods
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
	^ self explicitRequirement
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
	(self class parameters isEmpty
		or: [ self class parameters allSatisfy: #isOptional ])
		ifTrue: [ self requestBody: {} asDictionary.
			^ true ].

	self request hasEntity
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
					^ false ] ].
	^ true
]
