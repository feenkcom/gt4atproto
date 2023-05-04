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
	
	"aLexiconDocument hasMainDefinition ifTrue: [
		self 
			addLexiconDefiniton: aLexiconDocument mainDefinition 
			withId: aLexiconDocument id ]."
	 
	aLexiconDocument definitions keysAndValuesDo: [ :aDefinitionName :aLexiconDefinition |
		self 
			addLexiconDefiniton: aLexiconDefinition 
			withId: aLexiconDocument id , '#', aDefinitionName ]
]

{ #category : #accessing }
GtApLexicons >> buildObjects [
	| model |
	model := RBNamespace new.
	definitionsById
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className anApObject |
					anApObject := aDefinition asObject.
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					(RBAddClassRefactoring
						model: model
						addClass: className
						superclass: Object
						subclasses: #()
						category: #'Gt4AtProto-Generated') primitiveExecute.
					anApObject properties
						keysAndValuesDo: [ :aPropertyKey :aProperty | 
							| key |
							key := 'atProto' , aPropertyKey asCamelCase.
							(RBAddInstanceVariableRefactoring
								model: model
								variable: key
								class: className) primitiveExecute.
							(RBAddMethodRefactoring
								model: model
								addMethod: (aProperty generateGetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.
							(RBAddMethodRefactoring
								model: model
								addMethod: (aProperty generateSetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.

							(RBAddMethodRefactoring
								model: model
								addMethod: (aProperty
										generateDescriptorFor: aPropertyKey
										isRequired: (anApObject isPropertyRequired: aPropertyKey))
								toClass: className
								inProtocols: #magritte) primitiveExecute ] ] ].
	^ model
]

{ #category : #accessing }
GtApLexicons >> definitionWithId: anId [
	^ (anId includesSubstring: '#')
		ifTrue: [ definitionsById at: anId ]
		ifFalse: [ definitionsById at: anId, '#main' ]
]

{ #category : #accessing }
GtApLexicons >> definitionsByType [
	^ (definitionsById values groupedBy: [ :aDefinition |
		aDefinition type ]) collect: [ :anArray |
			GtApLexiconDefinitionsGroup withAll:  anArray ]
]

{ #category : #'gt - extensions' }
GtApLexicons >> gtViewDefinitionsByTypeFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Definitions (by type)';
		priority: 2;
		items: [ self definitionsByType associations
			sorted: [ :assoc | assoc value size ] descending ];
		column: 'Type' text: [ :assoc | assoc key ];
		column: 'Number of definitions' text: [ :assoc | assoc value size ];
		send: [ :assoc | assoc value ]
]

{ #category : #accessing }
GtApLexicons >> gtViewDefinitionsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Definitions';
		priority: 1;
		items: [ definitionsById associations ];
		column: 'Id' text: [ :assoc |
			assoc key ];
		column: 'Type' text: [ :assoc | assoc value type ] width: 75;
		column: 'Description' text: [ :assoc |
			assoc value description ifNil: [ '' ] ];
		send: [ :assoc |assoc value ]
]

{ #category : #accessing }
GtApLexicons >> gtViewDocumentsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Documents';
		priority: 10;
		items: [ documentsById values ];
		column: 'Id' text: #id;
		column: 'Main Type' text: #mainType width: 100;
		column: 'Definitions' 
			text: [ :aLexiconDocument |
				aLexiconDocument definitions size asString
					, ' '
					, ('definition' 
						asPluralBasedOn: aLexiconDocument definitions size) ]
			width: 120;
		column: 'Description' text: [ :aLexiconDocument |
			aLexiconDocument description ifNil: [''] ]
]

{ #category : #initiailize }
GtApLexicons >> initialize [
	super initialize.
	
	documentsById := OrderedDictionary new.
	definitionsById := OrderedDictionary new.
]

{ #category : #accessing }
GtApLexicons >> lexiconDocuments [
	^ documentsById values
]
