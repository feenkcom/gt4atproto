Class {
	#name : #GtApLexiconCoder,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'contentElement',
		'sidebarElement',
		'modified',
		'lexiconObject'
	],
	#category : #'Gt4AtProto-Editor-View'
}

{ #category : #accessing }
GtApLexiconCoder >> buildSidebarFor: obj [
	^ BrTabGroup new
		aptitude: BrGlamorousTabGroupAptitude;
		padding: (BlInsets all: 5);
		addTab: (BrTab new
				aptitude: BrGlamorousTabAptitude new;
				label: 'Files';
				stencil: [ self createFilesTreeFor: obj ]);
		addTab: (BrTab new
				aptitude: BrGlamorousTabAptitude new;
				label: 'Definitions';
				stencil: [ self createDefinitionsTreeFor: obj ]);
		actionbarStencil: [ BrToolbar new
				aptitude: BrGlamorousToolbarAptitude new;
				addItem: (self searchButtonFor: obj);
				yourself ]
]

{ #category : #accessing }
GtApLexiconCoder >> computeReferences: editor [
	editor editor cursors
		do: [ :each | 
			| node parents |
			node := lexiconObject lexiconFile ast nodeAt: each position.
			((node isKindOf: JSONMemberNode)
				and: [ each position between: node name startPosition and: node name stopPosition ])
				ifTrue: [ parents := node allParents.
					parents size = 3
						ifTrue: [ ((parents first isKindOf: JSONObjectNode)
								and: [ (parents last isKindOf: JSONObjectNode)
										and: [ (parents second isKindOf: JSONMemberNode)
												and: [ parents second name source = '"defs"' ] ] ])
								ifTrue: [ (lexiconObject lexiconFile
										definitionNamed: (node name source copyFrom: 2 to: node name source size - 1))
										ifNotNil: [ :def | editor phlow spawnObject: def references ] ] ] ] ]
]

{ #category : #accessing }
GtApLexiconCoder >> createDefinitionsTreeFor: obj [
	| tree |
	tree := BrSimpleTree new
			matchParent;
			rowStencil: BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new;
			nodeStencil: [ BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					fitContent;
					yourself ];
			nodeDataBinder: [ :element :each | element text: each name ];
			when: BlElementAddedToSceneGraphEvent do: [ :event | self updateTrees ];
			yourself.
	self updateDefinitionsTree: tree.
	tree
		when: BrSelectionChanged
		do: [ :event | 
			tree
				selectedNodeDo: [ :aNode | aNode value ifNotNil: [ :file | self updateContentsTo: file ] ] ].
	tree id: #definitions.
	^ tree
]

{ #category : #accessing }
GtApLexiconCoder >> createFilesTreeFor: obj [
	| tree |
	tree := BrSimpleTree new
			matchParent;
			rowStencil: BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new;
			nodeStencil: [ BrHorizontalPane new
					hMatchParent;
					vFitContent;
					addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude;
								fitContent;
								yourself)
						as: #label;
					addChild: (BrButton new
								background: self theme status changesBackgroundColor;
								size: 8 @ 8;
								geometry: BlEllipseGeometry new;
								margin: (BlInsets
										top: 6
										bottom: 0
										left: 2
										right: 2);
								visibility: BlVisibility gone;
								yourself)
						as: #button ];
			nodeDataBinder: [ :element :each | 
				element userData at: #lexiconFile put: each last.
				self updateModifiedIn: element.
				(element childNamed: #label) text: each first basename ];
			when: BlElementAddedToSceneGraphEvent do: [ :event | self updateTrees ];
			yourself.
	self updateFileTreeItems: tree.
	obj isLexiconDirectory
		ifFalse: [ tree
				expandSuchThat: [ :each | obj lexiconFile filename isContainedBy: each value first ].
			tree
				selectAndScrollTo: {obj lexiconFile filename.
						obj lexiconFile}.
			self updateContentsTo: obj ].
	tree
		when: BrSelectionChanged
		do: [ :event | 
			tree
				selectedNodeDo: [ :aNode | aNode value last ifNotNil: [ :file | self updateContentsTo: file ] ] ].
	tree id: #files.
	^ tree
]

{ #category : #accessing }
GtApLexiconCoder >> editorChangedTo: aString [
	contentElement
		childNamed: #editor
		ifFound: [ :editor | self lexiconFile source: aString asString ]
]

{ #category : #initialization }
GtApLexiconCoder >> initialize [
	super initialize.
	self matchParent.
	self initializeSidebar.
	self initializeContent.
	self addChild: sidebarElement as: #sidebar.
	self addChild: contentElement as: #content
]

{ #category : #initialization }
GtApLexiconCoder >> initializeContent [
	contentElement := BrHorizontalPane new
			background: Color white;
			aptitude: (BrStyleCommonAptitude new
							default: [ :aStyle | BlBorder paint: self theme default lightBorderColor width: 1 ];
							focused: [ :aStyle | 
								BlBorder
									paint: self theme default primaryBorderColor
									width: 1 ]);
			margin: (BlInsets all: 5);
			hMatchParent;
			vFitContentLimited
]

{ #category : #initialization }
GtApLexiconCoder >> initializeSidebar [
	sidebarElement := GtPhlowHorizontalSidebarElement new
			beLeft;
			matchParent;
			background: BrGlamorousColors neutralBackgroundColor.
	self
		addAptitude: (GtPhlowToolDetailAptitude new
				normal: [ :theInstance | sidebarElement hide ];
				detailed: [ :theInstance | sidebarElement show ]).
	sidebarElement hide
]

{ #category : #accessing }
GtApLexiconCoder >> lexiconFile [
	^ lexiconObject lexiconFile
]

{ #category : #accessing }
GtApLexiconCoder >> modificationColor [
	^ self lexiconFile isModified
		ifTrue: [ self theme status changesBackgroundColor ]
		ifFalse: [ Color transparent ]
]

{ #category : #accessing }
GtApLexiconCoder >> object: aLexiconModelObject [
	lexiconObject := aLexiconModelObject isLexiconDirectory
			ifTrue: [ aLexiconModelObject files isEmpty
					ifTrue: [ aLexiconModelObject ]
					ifFalse: [ aLexiconModelObject files first ] ]
			ifFalse: [ aLexiconModelObject ].
	sidebarElement contentStencil: [ self buildSidebarFor: lexiconObject ]
]

{ #category : #accessing }
GtApLexiconCoder >> searchButtonFor: obj [
	^ (GtSpotterDropdownButtonStencil new
		valuable: [ obj lexiconDirectory ];
		tooltip: 'Search';
		icon: BrGlamorousVectorIcons search;
		objectActOn: [ :anActOnEvent :anItem | 
			self updateFilesTo: anItem.
			self updateDefinitionsTo: anItem.
			self updateContentsTo: anItem.
			anActOnEvent beActed ]) asElement
]

{ #category : #accessing }
GtApLexiconCoder >> updateChangeStatus [
	modified = self lexiconFile isModified ifTrue: [ ^ self ].
	modified := self lexiconFile isModified.
	contentElement
		childNamed: #modificationBar
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt background: self modificationColor ] ].
	contentElement
		childNamed: #saveButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: self lexiconFile isModified ] ].
	contentElement
		childNamed: #cancelButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: self lexiconFile isModified ] ].
	sidebarElement
		childNamed: #files
		ifFound: [ :files | 
			files
				allChildrenBreadthFirstDetect: [ :each | (each userData at: #lexiconFile ifAbsent: [  ]) = self lexiconFile ]
				ifFound: [ :elmt | self updateModifiedIn: elmt ] ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateContentsTo: aLexiconObject [
	| textEditor content toolbar |
	modified := nil.
	lexiconObject := aLexiconObject.
	self lexiconFile announcer weak
		when: GtApLexiconFileSaved
		send: #updateChangeStatus
		to: self.
	self lexiconFile announcer weak
		when: GtApLexiconFileSourceChanged
		send: #updateChangeStatus
		to: self.
	self lexiconFile lexiconDirectory announcer weak
		when: GtApLexiconFileAdded
		send: #updateTrees
		to: self.
	self lexiconFile lexiconDirectory announcer weak
		when: GtApLexiconFileDeleted
		send: #updateTrees
		to: self.
	contentElement removeChildren.
	contentElement
		addChild: (BlElement new
				width: 5;
				constraintsDo: [ :c | c vertical matchParent ];
				yourself)
		as: #modificationBar.
	textEditor := aLexiconObject editor.
	textEditor
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryS;
				action: [ self lexiconFile saveFile ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryN;
				action: [ :event | self computeReferences: event source ]).
	textEditor editor
		when: BrTextEditorInsertedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BrTextEditorDeletedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BlInfiniteDataSourceChanged
			do: [ :event | self editorChangedTo: event source text asString ].
	content := BrVerticalPane new.
	content hMatchParent.
	content vFitContentLimited.
	content
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize
						foreground: Color gray;
						fontSize: 12);
				text: 'Lexicon file';
				yourself)
		as: #label.
	content
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new
						bold;
						fontSize: 18);
				text: aLexiconObject lexiconFile filename basename)
		as: #filename.
	content addChild: textEditor as: #editor.
	toolbar := BrToolbar new
			aptitude: (BrGlamorousToolbarAptitude new spacing: 5);
			fitContent;
			margin: (BlInsets bottom: 5).
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ self lexiconFile saveFile ])
		as: #saveButton.
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons cancel;
				label: 'Cancel';
				action: [ self lexiconFile cancel ])
		as: #cancelButton.
	content addChild: toolbar as: #toolbar.
	contentElement addChild: content.
	self updateChangeStatus
]

{ #category : #accessing }
GtApLexiconCoder >> updateDefinitionsTo: obj [
	self
		childNamed: #definitions
		ifFound: [ :tree | 
			tree
				expandSuchThat: [ :each | obj lexiconFile = each value or: [ obj = each value ] ].
			tree selectAndScrollTo: obj ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateDefinitionsTree: tree [
	tree
		items: (lexiconObject lexiconDirectory files
				asSortedCollection: [ :a :b | a name < b name ])
		lazy: [ :each | 
			each isLexiconFile
				ifTrue: [ each definitions asSortedCollection: [ :a :b | a name < b name ] ]
				ifFalse: [ #() ] ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateFileTreeItems: tree [
	tree
		items: {{lexiconObject lexiconDirectory directory absolutePath asFileReference.
						nil}}
			lazy: [ :each | 
				each first isDirectory
					ifTrue: [ (OrderedCollection
							withAll: (each first directories
									collect: [ :dir | 
										{dir.
											nil} ]))
							addAll: ((each first childrenMatching: '*.json')
									collect: [ :file | 
										{file.
											lexiconObject lexiconDirectory lexiconFileFor: file} ]);
							sort: [ :a :b | a first basename < b first basename ];
							yourself ]
					ifFalse: [ #() ] ];
		expandOneLevel
]

{ #category : #accessing }
GtApLexiconCoder >> updateFilesTo: obj [
	self
		childNamed: #files
		ifFound: [ :tree | 
			tree
				expandSuchThat: [ :each | obj lexiconFile filename isContainedBy: each value first ].
			tree
				selectAndScrollTo: {obj lexiconFile filename.
						obj lexiconFile} ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateModifiedIn: anElement [
	(anElement childNamed: #button)
		visibility: (((anElement userData at: #lexiconFile ifAbsent: [  ])
				ifNil: [ false ]
				ifNotNil: [ :file | file isModified ])
				ifTrue: [ BlVisibility visible ]
				ifFalse: [ BlVisibility gone ])
]

{ #category : #accessing }
GtApLexiconCoder >> updateTrees [
	lexiconObject ifNil: [ ^ self ].
	self
		inUIProcessDo: [ self
				childNamed: #files
				ifFound: [ :tree | 
					self updateFileTreeItems: tree.
					self updateFilesTo: lexiconObject ].
			self
				childNamed: #definitions
				ifFound: [ :tree | 
					self updateDefinitionsTree: tree.
					self updateDefinitionsTo: lexiconObject ] ]
]
