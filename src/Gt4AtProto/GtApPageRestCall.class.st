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
	| database pageId |
	database := self delegate database.
	pageId := self requestBody at: 'page'.

	^ (self validatePageUuid: pageId)
		ifTrue: [ database
				pageWithID: pageId
				ifAbsent: [ ZnResponse notFound: request uri entity: (ZnEntity text: 'Page not found') ] ]
		ifFalse: [ database
				pageNamed: pageId
				ifAbsent: [ ZnResponse notFound: request uri entity: (ZnEntity text: 'Page not found') ] ]
]

{ #category : #accessing }
GtApPageRestCall >> validatePageUuid: pageId [
	^ '^[0-9a-z]{25}$' asRegex matches: pageId
]
