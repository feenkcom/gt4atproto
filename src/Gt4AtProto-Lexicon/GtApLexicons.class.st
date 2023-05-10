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
GtApLexicons >> buildDefinitionObjectsIn: aModel inPackage: aPackageName [
	definitionsById
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className traitName anApObject |
					anApObject := aDefinition asObject.
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.

					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: Object
						subclasses: #()
						category: aPackageName) primitiveExecute.

					traitName
						asClassIfPresent: [ GtRBAddTraitUsageRefactoring traitName: traitName class: className ].

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
								inProtocols: #magritte) primitiveExecute ] ] ]
]

{ #category : #accessing }
GtApLexicons >> buildDocumentObjectsIn: aModel inPackage: aPackageName [
	documentsById
		keysAndValuesDo: [ :aKey :aDocument | 
			aDocument hasXRPCCalls
				ifTrue: [ | className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase
							, 'Client'.
					traitName := 'X' , className.
					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: GtApClient
						subclasses: #()
						category: aPackageName) primitiveExecute.


					traitName
						asClassIfPresent: [ GtRBAddTraitUsageRefactoring traitName: traitName class: className ].

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
	^ self buildObjectsInPackage: self defaultPackage
]

{ #category : #accessing }
GtApLexicons >> buildObjectsInPackage: aPackageName [
	| model |
	model := RBNamespace new.
	self buildDefinitionObjectsIn: model inPackage: aPackageName.
	self buildDocumentObjectsIn: model inPackage: aPackageName.
	^ model
]

{ #category : #accessing }
GtApLexicons >> defaultPackage [
	^ #'Gt4AtProto-Generated'
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
	
	^ aView forward 
		title: 'Documents';
		priority: 10;
		object: [ self lexiconDocuments ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtApLexicons >> gtViewNamespacesFor: aView [
	<gtView>
	^ aView tree
		title: 'Namespaces';
		items: [ GtApLexiconNamespacesBuilder new 
			buildNamespacesForLexicon: self ];
		children: [ :aNamespace | aNamespace childNamespaces ];
		expandAll;
		itemText: [ :aNamespace | aNamespace localName ]
]

{ #category : #initiailize }
GtApLexicons >> initialize [
	super initialize.
	
	documentsById := OrderedDictionary new.
	definitionsById := OrderedDictionary new.
]

{ #category : #accessing }
GtApLexicons >> lexiconDocuments [
	^ GtApLexiconDocumentsGroup withAll: documentsById values
]

{ #category : #accessing }
GtApLexicons >> removeObjects [
	definitionsById
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					className asClassIfPresent: #removeFromSystem ] ].

	documentsById
		keysAndValuesDo: [ :aKey :aDocument | 
			| className |
			aDocument hasXRPCCalls
				ifTrue: [ className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase , 'Client'.
					className asClassIfPresent: #removeFromSystem ] ]
]
