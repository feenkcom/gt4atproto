Class {
	#name : #GtApLexiconFileModel,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'filename',
		'source',
		'ast',
		'lexiconDirectory',
		'originalSource'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApLexiconFileModel >> ast [
	^ ast ifNil: [ ast := JSONParser parseWithErrors: self source ]
]

{ #category : #actions }
GtApLexiconFileModel >> cancel [
	self isModified ifFalse: [ ^ self ].
	self source: self originalSource
]

{ #category : #accessing }
GtApLexiconFileModel >> definitionNamed: aString [
	^ (self findDefinitionNode: aString)
		ifNotNil: [ :node | 
			GtApLexiconDefinitionModel new
				lexiconFile: self;
				name: aString;
				yourself ]
]

{ #category : #private }
GtApLexiconFileModel >> definitionNodes [
	^ self definitionNodesIn: self ast
]

{ #category : #private }
GtApLexiconFileModel >> definitionNodesIn: anAst [
	^ ((anAst / JSONMemberNode) @ #name <- '"defs"') / JSONObjectNode
		/ JSONMemberNode
]

{ #category : #views }
GtApLexiconFileModel >> editor [
	^ GtApLexiconEditorElement new
		lexiconFile: self;
		yourself
]

{ #category : #accessing }
GtApLexiconFileModel >> filename [
	^ filename
]

{ #category : #accessing }
GtApLexiconFileModel >> filename: aFileReference [
	filename := aFileReference asFileReference
]

{ #category : #private }
GtApLexiconFileModel >> findDefinitionNode: aString [
	^ (self definitionNodes @ #name <- ('"' , aString , '"')) asOrderedCollection
		at: 1
		ifAbsent: [  ]
]

{ #category : #accessing }
GtApLexiconFileModel >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #views }
GtApLexiconFileModel >> gtSourceFor: aView [
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
GtApLexiconFileModel >> id [
	| idNode |
	idNode := (((self ast / JSONMemberNode) @ #name <- '"id"') /@ #value)
			asOrderedCollection at: 1 ifAbsent: [  ].
	^ idNode
		ifNotNil: [ (idNode isKindOf: JSONStringNode)
				ifTrue: [ idNode value source allButFirst allButLast ] ]
]

{ #category : #accessing }
GtApLexiconFileModel >> initialize [
	super initialize.
	announcer := Announcer new
]

{ #category : #testing }
GtApLexiconFileModel >> isLexiconFile [
	^ true
]

{ #category : #testing }
GtApLexiconFileModel >> isModified [
	^ self originalSource ~= self source
]

{ #category : #accessing }
GtApLexiconFileModel >> lexiconDirectory [
	^ lexiconDirectory
]

{ #category : #accessing }
GtApLexiconFileModel >> lexiconDirectory: anObject [
	lexiconDirectory := anObject
]

{ #category : #accessing }
GtApLexiconFileModel >> lexiconFile [
	^ self
]

{ #category : #accessing }
GtApLexiconFileModel >> lexicons [
	^ lexiconDirectory ifNotNil: [ lexiconDirectory lexicons ]
]

{ #category : #accessing }
GtApLexiconFileModel >> originalSource [
	^ originalSource
		ifNil: [ filename ifNotNil: [ originalSource := filename contents ] ]
]

{ #category : #actions }
GtApLexiconFileModel >> saveFile [
	self isModified ifFalse: [ ^ self ].
	filename
		ensureDelete;
		writeStreamDo: [ :stream | stream nextPutAll: source ].
	originalSource := self source
]

{ #category : #accessing }
GtApLexiconFileModel >> source [
	^ source ifNil: [ source := self originalSource ]
]

{ #category : #accessing }
GtApLexiconFileModel >> source: aString [
	| oldSource |
	source = aString ifTrue: [ ^ self ].
	oldSource := source.
	source := aString.
	ast := nil.
	self
		announce: (GtApLexiconFileSourceChanged new
				lexiconFile: self;
				oldSource: oldSource;
				yourself)
]
