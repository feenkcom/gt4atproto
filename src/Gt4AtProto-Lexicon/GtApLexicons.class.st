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
GtApLexicons >> definitionWithId: anId [
	^ (anId includesSubstring: '#')
		ifTrue: [ definitionsById at: anId ]
		ifFalse: [ definitionsById at: anId, '#main' ]
]

{ #category : #accessing }
GtApLexicons >> definitionWithId: anId ifAbsent: aBlock [
	^ (anId includesSubstring: '#')
		ifTrue: [ definitionsById at: anId ifAbsent: aBlock ]
		ifFalse: [ definitionsById at: anId , '#main' ifAbsent: aBlock ]
]

{ #category : #accessing }
GtApLexicons >> definitions [
	^ definitionsById
]

{ #category : #accessing }
GtApLexicons >> definitionsByType [
	^ (definitionsById values groupedBy: [ :aDefinition |
		aDefinition type ]) collect: [ :anArray |
			GtApLexiconDefinitionsGroup withAll:  anArray ]
]

{ #category : #accessing }
GtApLexicons >> documents [
	^ documentsById
]

{ #category : #accessing }
GtApLexicons >> gtAtpLexiconsFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Object references';
		priority: 1.1;
		painting: [ :m | 
			m nodes
				stencil: [ :eachClass | 
					BlElement new
						geometry: BlCircleGeometry new;
						background: Color black;
						aptitude: ((BrGlamorousWithLabelTooltipAptitude new text: eachClass id) + (BrStyleCommonAptitude new
						default: [ :s | s background: Color black ];
						hovered: [ :s | s background: Color blue lighter ];
						pressed: [ :s | s background: Color blue muchLighter ]));
						size: 10 @ 10 ];
				with: (definitionsById values select: [:each | each isKindOf: GtApLexiconObject ]).
			m edges
				stencil: [ :eachClass | 
					BlLineElement new
						zIndex: -1;
						border: Color lightGray;
						toHead: (BlArrowheadSimpleArrow new
								border: (BlBorder paint: (Color lightGray alpha: 0.8))) ];
				connectToAll: [ :eachDefinition | eachDefinition resolvedReferencedDefinitions ].
			m layout force  charge: -100];
		actionUpdateButton
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
		items: [ definitionsById associations sorted: [ :a :b | a key < b key ] ];
		column: 'Id' text: [ :assoc | assoc key ];
		column: 'Type'
			text: [ :assoc | assoc value type ]
			width: 75;
		column: 'Description'
			text: [ :assoc | assoc value description ifNil: [ '' ] ];
		send: [ :assoc | assoc value ]
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

{ #category : #adding }
GtApLexicons >> removeLexiconDefinitonWithId: anId [
	definitionsById removeKey: anId ifAbsent: [  ]
]

{ #category : #adding }
GtApLexicons >> removeLexiconDocumentForFile: aFileReference [
	| document |
	document := documentsById
			detect: [ :each | each documentFile = aFileReference ]
			ifNone: [ ^ self ].

	documentsById removeKey: document id ifAbsent: [  ].

	document definitions
		keysAndValuesDo: [ :aDefinitionName :aLexiconDefinition | self removeLexiconDefinitonWithId: document id , '#' , aDefinitionName ]
]
