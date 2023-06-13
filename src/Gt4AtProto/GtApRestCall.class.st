Class {
	#name : #GtApRestCall,
	#superclass : #ZnJSONRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApRestCall class >> allowedMethods [
	^ #()
]

{ #category : #accessing }
GtApRestCall class >> errors [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApRestCall class >> isAbstract [
	^ self name = GtApRestCall name
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
