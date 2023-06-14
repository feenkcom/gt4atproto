Class {
	#name : #GtApPagesRestCall,
	#superclass : #GtApListRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApPagesRestCall class >> errors [
	^ {'BadRequest'.
		'NotFound'}
]

{ #category : #accessing }
GtApPagesRestCall class >> modelEntity [
	^ LePage
]

{ #category : #accessing }
GtApPagesRestCall class >> parameters [
	^ {GtApRestCallParameter new
			name: 'database';
			type: (GtApLexiconString new format: 'uuid')}
]

{ #category : #accessing }
GtApPagesRestCall class >> pattern [
	^ #('pages')
]

{ #category : #accessing }
GtApPagesRestCall >> list [
	| database |
	database := self delegate database.
	(self requestBody includesKey: 'database')
		ifTrue: [ | databaseId |
			databaseId := self requestBody at: 'database'.
			(self validateDatabaseUuid: databaseId)
				ifTrue: [ database
						databaseWithID: databaseId
						ifNone: [ self notFound: request withMessage: 'Database not found' ] ]
				ifFalse: [ database
						databaseNamed: databaseId
						ifNone: [ self notFound: request uri withMessage: 'Database not found' ] ] ].

	^ database pages
]

{ #category : #accessing }
GtApPagesRestCall >> validateDatabaseUuid: pageId [
	^ '^[0-9a-z]{25}$' asRegex matches: pageId
]
