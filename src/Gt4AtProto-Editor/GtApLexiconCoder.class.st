Class {
	#name : #GtApLexiconCoder,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'sidebar',
		'content',
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-View'
}

{ #category : #accessing }
GtApLexiconCoder >> editorChanged [
	content
		childNamed: #editor
		ifFound: [ :editor | lexiconFile source: editor editor text asString ].
	self updateChangeStatus
]

{ #category : #initialization }
GtApLexiconCoder >> initialize [
	super initialize.
	self matchParent.
	self initializeSidebar.
	self initializeContent.
	self addChild: sidebar as: #sidebar.
	self addChild: content as: #content
]

{ #category : #initialization }
GtApLexiconCoder >> initializeContent [
	content := BrHorizontalPane new
			hMatchParent;
			vFitContentLimited
]

{ #category : #initialization }
GtApLexiconCoder >> initializeSidebar [
	sidebar := GtPhlowHorizontalSidebarElement new
			beLeft;
			matchParent;
			background: BrGlamorousColors neutralBackgroundColor.
	self
		addAptitude: (GtPhlowToolDetailAptitude new
				normal: [ :theInstance | sidebar hide ];
				detailed: [ :theInstance | sidebar show ]).
	sidebar hide
]

{ #category : #accessing }
GtApLexiconCoder >> object: aLexiconModelObject [
	| obj |
	obj := aLexiconModelObject isLexiconDirectory
			ifTrue: [ aLexiconModelObject files isEmpty
					ifTrue: [ aLexiconModelObject ]
					ifFalse: [ aLexiconModelObject files first ] ]
			ifFalse: [ aLexiconModelObject ].
	sidebar
		contentStencil: [ | tree |
			tree := BrSimpleTree new
					matchParent;
					rowStencil: BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new;
					nodeStencil: [ BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							hMatchParent;
							vFitContent ];
					nodeDataBinder: [ :element :each | element text: each basename ];
					items: {obj lexiconDirectory directory absolutePath asFileReference}
						lazy: [ :each | 
							each isDirectory
								ifTrue: [ (OrderedCollection withAll: each directories)
										addAll: (each childrenMatching: '*.json');
										sort: [ :a :b | a basename < b basename ];
										yourself ]
								ifFalse: [ #() ] ];
					expandOneLevel.
			obj isLexiconDirectory
				ifFalse: [ tree
						expandSuchThat: [ :each | obj lexiconFile filename isContainedBy: each value ].
					tree selectAndScrollTo: obj lexiconFile filename.
					self updateContentsTo: obj ].
			tree
				when: BrSelectionChanged
				do: [ :event | 
					tree
						selectedNodeDo: [ :aNode | 
							(obj lexiconDirectory lexiconFileFor: aNode value)
								ifNotNil: [ :file | self updateContentsTo: file ] ] ].
			tree ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateChangeStatus [
	content
		childNamed: #modificationBar
		ifFound: [ :elmt | 
			elmt
				inUIProcessDo: [ elmt
						background: (lexiconFile isModified
								ifTrue: [ self theme status changesBackgroundColor ]
								ifFalse: [ Color transparent ]) ] ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateContentsTo: aLexiconObject [
	| textEditor |
	lexiconFile := aLexiconObject lexiconFile.
	content removeChildren.
	content
		addChild: (BlElement new
				width: 8;
				constraintsDo: [ :c | c vertical matchParent ];
				yourself)
		as: #bar.
	content
		addChild: (BlElement new
				width: 5;
				constraintsDo: [ :c | c vertical matchParent ];
				yourself)
		as: #modificationBar.
	textEditor := aLexiconObject editor.
	textEditor editor
		when: BrTextEditorInsertedEvent do: [ :event | self editorChanged ];
		when: BrTextEditorDeletedEvent do: [ :event | self editorChanged ];
		when: BlInfiniteDataSourceChanged do: [ :event | self editorChanged ].
	content addChild: textEditor as: #editor.
	self updateChangeStatus
]
