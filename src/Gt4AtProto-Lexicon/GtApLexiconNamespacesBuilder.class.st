Class {
	#name : #GtApLexiconNamespacesBuilder,
	#superclass : #Object,
	#category : #'Gt4AtProto-Lexicon-Documents'
}

{ #category : #accessing }
GtApLexiconNamespacesBuilder >> buildNamespacesForDocuments: aCollection atLevel: anInteger [ 
	| documentGroups |
	
	documentGroups := (aCollection groupedBy: [ :aDocument | 
		self extractIdPartAtLevel: anInteger from: aDocument id ]) .
		
	^ documentGroups associations collect: [ :assoc |
		| newNamespace |
		newNamespace := GtApLexiconNamespace withId: assoc key.
		self updateNamespace: newNamespace withDocuments: assoc value.
		newNamespace ]
]

{ #category : #accessing }
GtApLexiconNamespacesBuilder >> buildNamespacesForLexicon: aLexicon [
	^ self 
		buildNamespacesForDocuments: aLexicon lexiconDocuments
		atLevel: 1
]

{ #category : #accessing }
GtApLexiconNamespacesBuilder >> extractIdPartAtLevel: anInteger from: anId [ 
	^ String streamContents: [:s | 
		((anId splitOn: $.) first: anInteger) asStringOn: s delimiter: '.']
]

{ #category : #accessing }
GtApLexiconNamespacesBuilder >> updateNamespace: aNamespace withDocuments: aCollection [ 
	| leafDocuments childDocuments childNamespaces |
	
	leafDocuments := aCollection select: [ :aDocument |
		((aDocument id withoutPrefix: aNamespace id) occurrencesOf: $.) = 1 ].
	aNamespace documentDefinitions: leafDocuments.
	childDocuments := aCollection copyWithoutAll: leafDocuments.
	childNamespaces := self 
		buildNamespacesForDocuments: childDocuments 
		atLevel: aNamespace depthLevel + 1.
	aNamespace childNamespaces: childNamespaces.
	
]
