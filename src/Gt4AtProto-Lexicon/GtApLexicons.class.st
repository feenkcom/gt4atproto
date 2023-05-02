Class {
	#name : #GtApLexicons,
	#superclass : #Object,
	#instVars : [
		'documentsById',
		'definitionsById'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #adding }
GtApLexicons >> addLexiconDefiniton: aLexiconDefinition withId: anId [
	self assert: (definitionsById includesKey: anId) not.
	
	definitionsById at:  anId put: aLexiconDefinition.
]

{ #category : #adding }
GtApLexicons >> addLexiconDocument: aLexiconDocument [
	self assert: (documentsById includesKey: aLexiconDocument id) not.
	
	documentsById 
		at: aLexiconDocument id
		put: aLexiconDocument.
	
	aLexiconDocument hasMainDefinition ifTrue: [
		self 
			addLexiconDefiniton: aLexiconDocument mainDefinition 
			withId: aLexiconDocument id ].
	 
	aLexiconDocument definitions keysAndValuesDo: [ :aDefinitionName :aLexiconDefinition |
		self 
			addLexiconDefiniton: aLexiconDefinition 
			withId: aLexiconDocument id , '#', aDefinitionName ]
]

{ #category : #accessing }
GtApLexicons >> gtViewDefinitionsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Definitions';
		items: [ definitionsById associations ];
		column: 'Id' text: [ :assoc |
			assoc key ];
		column: 'Type' text: [ :assoc | assoc value type ] width: 75;
		column: 'Description' text: [ :assoc |
			assoc value description ifNil: [ '' ] ];
		send: [ :assoc |
			assoc value ]
]

{ #category : #accessing }
GtApLexicons >> gtViewDocumentsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Documents';
		items: [ documentsById values ];
		column: 'Id' text: [ :aLexiconDocument |
			aLexiconDocument id ];
		column: 'Description' text: [ :aLexiconDocument |
			aLexiconDocument description ifNil: [''] ]
]

{ #category : #initiailize }
GtApLexicons >> initialize [
	super initialize.
	
	documentsById := OrderedDictionary new.
	definitionsById := OrderedDictionary new.
]
