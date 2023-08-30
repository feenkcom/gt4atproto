Class {
	#name : #GtApExampleRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-RestCall - Examples'
}

{ #category : #accessing }
GtApExampleRestCall class >> allowedMethods [
	^ #( GET )
]

{ #category : #accessing }
GtApExampleRestCall class >> endpointName [
	^ 'exampleCall'
]

{ #category : #accessing }
GtApExampleRestCall class >> errors [
	^ {'BadRequest'.
		'NotFound'.
		'Teapot'}
]

{ #category : #accessing }
GtApExampleRestCall class >> isAbstract [
	^ true
]

{ #category : #accessing }
GtApExampleRestCall class >> modelClass [
	^ GtApRestModelEntity forEntity: String
]

{ #category : #accessing }
GtApExampleRestCall class >> parameters [
	^ {GtApRestCallParameter new
			name: 'foo';
			type: GtApLexiconBoolean new.
		GtApRestCallParameter new
			name: 'bar';
			type: (GtApLexiconString new format: 'uri')}
]

{ #category : #accessing }
GtApExampleRestCall class >> pattern [
	^ {}
]

{ #category : #accessing }
GtApExampleRestCall >> get [
	^ (self requestBody at: 'foo')
		ifTrue: [ ^ 'Missiles launched' ]
		ifFalse: [ self requestBody at: 'bar' ]
]
