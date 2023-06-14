Class {
	#name : #GtApPageRestCall,
	#superclass : #GtApFetchRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApPageRestCall class >> errors [
	^ #()
]

{ #category : #accessing }
GtApPageRestCall class >> modelEntity [
	^ LePage
]

{ #category : #accessing }
GtApPageRestCall class >> parameters [
	^ {GtApRestCallParameter new beRequired
			name: 'page';
			type: (GtApLexiconString new format: 'uuid')}
]

{ #category : #accessing }
GtApPageRestCall class >> pattern [
	^ #('page')
]

{ #category : #accessing }
GtApPageRestCall >> fetch [
	| database |
	database := self delegate database.
	
	^ database
		pageWithID: (self requestBody at: 'page')
		ifAbsent: [ ^ ZnResponse notFound: request uri ]
]
