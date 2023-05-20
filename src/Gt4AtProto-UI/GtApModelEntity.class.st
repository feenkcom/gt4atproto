Class {
	#name : #GtApModelEntity,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'targetUrl',
		'loginData',
		'client'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApModelEntity class >> allReferences [
	| argument |
	^ (Pragma allNamed: 'atpType:format:' in: self)
		flatCollect: [ :aPragma | 
			argument := aPragma argumentNamed: #atpType:.
			argument isSymbol
				ifFalse: [ argument collect: #asClass ]
				ifTrue: [ {argument asClass} ] ]
]

{ #category : #accessing }
GtApModelEntity class >> atpFile [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> atpRecordName [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> atpSchema [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> customReferences [
	^ self allReferences select: [ :aClass | aClass inheritsFrom: GtApModelEntity ]
]

{ #category : #accessing }
GtApModelEntity class >> findForRequest: aRequest [
	| typeName |
	typeName := aRequest at: '$type' ifAbsent: [ ^ aRequest ].
	self
		allSubclassesDo: [ :aModelEntityClass | 
			aModelEntityClass atpRecordName = typeName
				ifTrue: [ ^ aModelEntityClass fromRequest: aRequest ] ].
	^ aRequest
]

{ #category : #accessing }
GtApModelEntity class >> fromRawData: aDictionary [
	^ self new 
		rawData: aDictionary
]

{ #category : #accessing }
GtApModelEntity class >> gtSchemaFor: aView [
	<gtView>
	<gtClassView>
	^ aView forward
		title: 'Schema';
		priority: 51;
		object: [ GtJson forJsonString: self atpSchema ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons note
			tooltip: 'Browse schema file'
			action: [ :aButton | 
				aButton phlow
					spawnObject: 'atproto' asFileReference / 'lexicons' / self atpFile ]
]

{ #category : #accessing }
GtApModelEntity class >> gtViewDefinitionReferencesFor: aView [ 
	<gtView>
	<gtClassView>
	
	^ aView mondrian
		title: 'Definition references';
		priority: 45;
		painting: [ :view | 
			self 
				paintDefinitionReferences: self withAllCustomReferences 
				on: view ]
]

{ #category : #accessing }
GtApModelEntity class >> methodId [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> paintDefinitionReferences: aCollectionOfDefinitions on: aView [
	aView nodes
		stencil: [ :aClass | 
			| string container |
			string := aClass atpRecordName.
			container := BrVerticalPane new
					fitContent;
					margin: (BlInsets all: 10);
					aptitude: BrShadowAptitude;
					padding: (BlInsets all: 5);
					background: (aClass == self ifTrue: [ Color blue muchLighter ] ifFalse: [ Color white ]).
			(string findTokens: '#')
				do: [ :token | 
					container
						addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude new;
								text: token) ].
			container
				when: BlClickEvent
				do: [ :e | 
					e consumed: true.
					e target phlow spawnTool: (GtClassCoderTool forClass: aClass) ] ];
		with: aCollectionOfDefinitions.

	aView edges
		stencil: [ :aDefinition :fromElement :toElement | 
			| lineColor |
			lineColor := Color gray alpha: 0.2.
			fromElement = toElement
				ifFalse: [ BlLineElement new
						border: lineColor;
						toHead: (BlArrowheadSimpleArrow new border: lineColor) ]
				ifTrue: [ BlParabollaArcElement new
						zIndex: 0;
						curvatureFraction: 0.5;
						border: lineColor;
						toHead: (BlArrowheadSimpleArrow new border: lineColor) ] ];
		connectToAll: [ :aDefinition | aDefinition customReferences ].

	aView layout horizontalTree
		levelDistance: 30;
		nodeDistance: 10.

	aView
]

{ #category : #accessing }
GtApModelEntity class >> withAllCustomReferences [
	| referencedObjects |
	referencedObjects := OrderedCollection new.
	self
		withAllCustomReferencesDo: [ :aDefiniton | 
			(referencedObjects includes: aDefiniton)
				ifFalse: [ referencedObjects add: aDefiniton ] ].
	^ referencedObjects
]

{ #category : #accessing }
GtApModelEntity class >> withAllCustomReferencesDo: aBlock [
	^ self 
		withDeep: [ :aDefinition | aDefinition customReferences ] 
		do: aBlock
]

{ #category : #accessing }
GtApModelEntity >> client [
	^ client
]

{ #category : #accessing }
GtApModelEntity >> client: anObject [
	client := anObject.
	self onClientChanged
]

{ #category : #accessing }
GtApModelEntity >> gtFileNameFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Schema file';
		priority: 52;
		text: [ self class atpFile ];
		actionButtonIcon: BrGlamorousVectorIcons note
			tooltip: 'Browse schema file'
			action: [ :aButton | 
				aButton phlow
					spawnObject: 'atproto' asFileReference / 'lexicons' / self class atpFile ]
]

{ #category : #accessing }
GtApModelEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Raw data';
		priority: 40;
		items: [ rawData associations ];
		column: 'Property' text: #key;
		column: 'Value' text: #value;
		children: [ :each | 
			each value isDictionary
				ifTrue: [ each value associations ]
				ifFalse: [ (each value isArray and: [ each value allSatisfy: #isDictionary ])
						ifTrue: [ each value collectWithIndex: [ :x :i | i -> x ] ]
						ifFalse: [ #() ] ] ];
		send: #value
]

{ #category : #accessing }
GtApModelEntity >> gtSchemaFor: aView [
	<gtView>
	<gtClassView>
	^ aView forward
		title: 'Schema';
		priority: 51;
		object: [ self class ];
		view: #gtSchemaFor:
]

{ #category : #accessing }
GtApModelEntity >> gtViewDefinitionReferencesFor: aView [ 
	<gtView>
	
	^ self class gtViewDefinitionReferencesFor: aView
]

{ #category : #accessing }
GtApModelEntity >> initialize [
	client := GtApClient new
]

{ #category : #accessing }
GtApModelEntity >> loginData [
	^ loginData
]

{ #category : #accessing }
GtApModelEntity >> loginData: anObject [
	loginData := anObject
]

{ #category : #accessing }
GtApModelEntity >> onClientChanged [
	"can be overriden by subclasses to react to client changes"
]

{ #category : #accessing }
GtApModelEntity >> rawData: aDictionary [ 
	rawData := aDictionary
]

{ #category : #accessing }
GtApModelEntity >> targetUrl [
	^ targetUrl
]

{ #category : #accessing }
GtApModelEntity >> targetUrl: anObject [
	targetUrl := anObject
]
