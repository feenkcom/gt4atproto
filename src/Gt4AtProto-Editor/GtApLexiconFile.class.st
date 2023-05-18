Class {
	#name : #GtApLexiconFile,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'filename',
		'source',
		'ast',
		'announcer',
		'lexicons'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #announcer }
GtApLexiconFile >> announcer [
	^ announcer
]

{ #category : #accessing }
GtApLexiconFile >> ast [
	^ ast ifNil: [ ast := JSONParser parseWithErrors: self source ]
]

{ #category : #accessing }
GtApLexiconFile >> definitionNamed: aString [
	^ (self findDefinitionNode: aString)
		ifNotNil: [ :node | 
			GtApDefinition new
				lexiconFile: self;
				node: node;
				yourself ]
]

{ #category : #private }
GtApLexiconFile >> definitionNodes [
	^ self definitionNodesIn: self ast
]

{ #category : #private }
GtApLexiconFile >> definitionNodesIn: anAst [
	^ ((anAst / JSONMemberNode) @ #name <- '"defs"') / JSONObjectNode
		/ JSONMemberNode
]

{ #category : #views }
GtApLexiconFile >> editor [
	^ GtApLexiconEditorElement new
		lexiconFile: self;
		yourself
]

{ #category : #accessing }
GtApLexiconFile >> filename [
	^ filename
]

{ #category : #accessing }
GtApLexiconFile >> filename: aFileReference [
	filename := aFileReference asFileReference
]

{ #category : #private }
GtApLexiconFile >> findDefinitionNode: aString [
	^ (self definitionNodes @ #name <- ('"' , aString , '"')) asOrderedCollection
		at: 1
		ifAbsent: [  ]
]

{ #category : #accessing }
GtApLexiconFile >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #views }
GtApLexiconFile >> gtSourceFor: aView [
	<gtView>
	| editor |
	^ aView explicit
		title: 'Source';
		stencil: [ editor := self editor ];
		actionButtonIcon: BrGlamorousVectorIcons accept
			tooltip: 'Save'
			action: [ self
					source: editor editor text asString;
					saveFile ]
]

{ #category : #accessing }
GtApLexiconFile >> id [
	| idNode |
	idNode := (((self ast / JSONMemberNode) @ #name <- '"id"') /@ #value)
			asOrderedCollection at: 1 ifAbsent: [  ].
	^ idNode
		ifNotNil: [ (idNode isKindOf: JSONStringNode)
				ifTrue: [ idNode value source allButFirst allButLast ] ]
]

{ #category : #accessing }
GtApLexiconFile >> initialize [
	super initialize.
	announcer := Announcer new
]

{ #category : #accessing }
GtApLexiconFile >> lexicons [
	^ lexicons
]

{ #category : #accessing }
GtApLexiconFile >> lexicons: anObject [
	lexicons := anObject
]

{ #category : #accessing }
GtApLexiconFile >> saveFile [
	filename
		ensureDelete;
		writeStreamDo: [ :stream | stream nextPutAll: source ]
]

{ #category : #accessing }
GtApLexiconFile >> source [
	^ source ifNil: [ filename ifNotNil: [ source := filename contents ] ]
]

{ #category : #accessing }
GtApLexiconFile >> source: aString [
	| oldSource |
	oldSource := source.
	source := aString.
	ast := nil.
	self
		announce: (GtApLexiconFileSourceChanged new
				lexiconFile: self;
				oldSource: oldSource;
				yourself)
]
