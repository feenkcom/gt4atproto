Class {
	#name : #GTApLexiconReferencesRevolver,
	#superclass : #Object,
	#instVars : [
		'lexicon'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveGlobalReferenceId: anId [ 
	^ lexicon definitionWithId: anId
]

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveLexicon: aLexicon [
	lexicon := aLexicon.
	
	aLexicon lexiconDocuments do: [ :aDocument |
		self resolveReferencesInDocument: aDocument]
]

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveLocalReferenceId: anId fromDocument: aDocument [ 
	^ aDocument definitionWithName: anId
]

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveReferenceId: anId fromDocument: aDocument [ 
	^ (anId beginsWith: '#')
		ifTrue: [
			self 
				resolveLocalReferenceId: anId copyWithoutFirst
					fromDocument: aDocument  ]
		ifFalse: [
			self resolveGlobalReferenceId: anId ]
]

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveReferencesInDefiniton: aDefiniton fromDocument: aDocument [ 

	(aDefiniton referencedDefinitions 
		select: [ :aReferencedDefinition |
			aReferencedDefinition isReference ])
		do: [ :aReferenceDefiniton |
			aReferenceDefiniton 
				resolveContainedReferenceUsing: [ :aReferenceId |
					self 
						resolveReferenceId: aReferenceId 
						fromDocument: aDocument ]  ]
]

{ #category : #accessing }
GTApLexiconReferencesRevolver >> resolveReferencesInDocument: aDocument [ 

	aDocument definitions do: [ :aDefiniton |
		self 
			resolveReferencesInDefiniton: aDefiniton 
			fromDocument: aDocument]
]
