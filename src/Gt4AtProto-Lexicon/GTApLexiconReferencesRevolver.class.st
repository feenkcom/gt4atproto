Class {
	#name : #GtApLexiconReferencesRevolver,
	#superclass : #Object,
	#instVars : [
		'lexicon'
	],
	#category : #'Gt4AtProto-Lexicon-Importer'
}

{ #category : #accessing }
GtApLexiconReferencesRevolver >> collectReferencesInDefinition: aDefiniton [ 
	^ GtApLexiconReferencesCollectorVisitor collectForDefinition:  aDefiniton
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveGlobalReferenceId: anId [ 
	^ lexicon definitionWithId: anId
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveLexicon: aLexicon [
	lexicon := aLexicon.
	
	aLexicon lexiconDocuments do: [ :aDocument |
		self resolveReferencesInDocument: aDocument]
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveLocalReferenceId: anId fromDocument: aDocument [ 
	^ aDocument definitionWithName: anId
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveReferenceId: anId fromDocument: aDocument [ 
	^ (anId beginsWith: '#')
		ifTrue: [
			self 
				resolveLocalReferenceId: anId copyWithoutFirst
					fromDocument: aDocument  ]
		ifFalse: [
			self resolveGlobalReferenceId: anId ]
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveReferencesInDefiniton: aDefiniton fromDocument: aDocument [ 
	(self collectReferencesInDefinition: aDefiniton)
		do: [ :aReferenceDefiniton |
			aReferenceDefiniton 
				resolveContainedReferenceUsing: [ :aReferenceId |
					self 
						resolveReferenceId: aReferenceId 
						fromDocument: aDocument ]  ]
]

{ #category : #accessing }
GtApLexiconReferencesRevolver >> resolveReferencesInDocument: aDocument [ 
	aDocument definitions do: [ :aDefiniton |
		self 
			resolveReferencesInDefiniton: aDefiniton 
			fromDocument: aDocument]
]
