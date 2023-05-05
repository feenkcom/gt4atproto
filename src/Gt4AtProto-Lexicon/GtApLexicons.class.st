Class {
	#name : #GtApLexicons,
	#superclass : #Object,
	#instVars : [
		'documentsById',
		'definitionsById'
	],
	#category : #'Gt4AtProto-Lexicon-Importer'
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
GtApLexicons >> buildDefinitionObjectsIn: aModel [ 
	definitionsById
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className anApObject |
					anApObject := aDefinition asObject.
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: Object
						subclasses: #()
						category: #'Gt4AtProto-Generated') primitiveExecute.
					anApObject properties
						keysAndValuesDo: [ :aPropertyKey :aProperty | 
							| key |
							key := 'atProto' , aPropertyKey asCamelCase.
							(RBAddInstanceVariableRefactoring
								model: aModel
								variable: key
								class: className) primitiveExecute.
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty generateGetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty generateSetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.

							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty
										generateDescriptorFor: aPropertyKey
										isRequired: (anApObject isPropertyRequired: aPropertyKey))
								toClass: className
								inProtocols: #magritte) primitiveExecute ] ] ].
]

{ #category : #accessing }
GtApLexicons >> buildDocumentObjectsIn: aModel [
	documentsById
		keysAndValuesDo: [ :aKey :aDocument | 
			| className |
			aDocument hasXRPCCalls
				ifTrue: [ className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase , 'Client'.
					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: ATPClient
						subclasses: #()
						category: #'Gt4AtProto-Generated') primitiveExecute.

					aDocument xrpcCalls
						keysAndValuesDo: [ :aName :aMethod | 
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aMethod asXRPCMethodNamed: aKey)
								toClass: className
								inProtocols: {#'atproto-xrpc-call'}) primitiveExecute ] ] ]
]

{ #category : #accessing }
GtApLexicons >> buildObjects [
	| model |
	model := RBNamespace new.
	self buildDefinitionObjectsIn: model.
	self buildDocumentObjectsIn: model.
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

{ #category : #accessing }
GtApLexicons >> removeObjects [
	definitionsById
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					className asClass removeFromSystem ] ].

	documentsById
		keysAndValuesDo: [ :aKey :aDocument | 
			| className |
			aDocument hasXRPCCalls
				ifTrue: [ className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase , 'Client'.
					className asClass removeFromSystem ] ]
]
