Class {
	#name : #GtApLexiconNamespace,
	#superclass : #Object,
	#instVars : [
		'id',
		'childNamespaces',
		'documentDefinitions'
	],
	#category : #'Gt4AtProto-Lexicon-Documents'
}

{ #category : #'instance creation' }
GtApLexiconNamespace class >> withId: anId [
	^ self new
		initializeWithId: anId
]

{ #category : #accessing }
GtApLexiconNamespace >> childNamespaces [
	^ childNamespaces
]

{ #category : #accessing }
GtApLexiconNamespace >> childNamespaces: anObject [
	childNamespaces := anObject
]

{ #category : #accessing }
GtApLexiconNamespace >> depthLevel [
	^ (id occurrencesOf: $.) + 1
]

{ #category : #accessing }
GtApLexiconNamespace >> documentDefinitions [
	^ documentDefinitions
]

{ #category : #accessing }
GtApLexiconNamespace >> documentDefinitions: anObject [
	documentDefinitions := anObject
]

{ #category : #printing }
GtApLexiconNamespace >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	
	aStream parenthesize: [
		aStream << self id ]
]

{ #category : #accessing }
GtApLexiconNamespace >> gtViewDocumentsFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Documents';
		priority: 10;
		object: [ self documentDefinitions ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtApLexiconNamespace >> id [
	^ id
]

{ #category : #initialization }
GtApLexiconNamespace >> initializeWithId: anId [ 
	id := anId.
	documentDefinitions := OrderedCollection new.
]

{ #category : #accessing }
GtApLexiconNamespace >> localName [
	| dotIndex |
	dotIndex := id 
		lastIndexOf: $.
		ifAbsent: [ ^ id ].
		
	^ id copyFrom: dotIndex + 1 to: id size
]
