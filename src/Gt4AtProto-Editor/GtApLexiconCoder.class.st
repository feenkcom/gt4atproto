Class {
	#name : #GtApLexiconCoder,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'lexiconFile',
		'contentElement',
		'sidebarElement'
	],
	#category : #'Gt4AtProto-Editor-View'
}

{ #category : #accessing }
GtApLexiconCoder >> editorChanged [
	contentElement
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
	self addChild: sidebarElement as: #sidebar.
	self addChild: contentElement as: #content
]

{ #category : #initialization }
GtApLexiconCoder >> initializeContent [
	contentElement := BrHorizontalPane new
			background: Color white;
			aptitude: BrShadowAptitude new
					+ (BrStyleCommonAptitude new
							default: [ :aStyle | BlBorder paint: self theme default lightBorderColor width: 1 ];
							focused: [ :aStyle | 
								BlBorder
									paint: (self theme default primaryBorderColor alpha: 0.4) gtOpaqueColorOnWhite
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
GtApLexiconCoder >> object: aLexiconModelObject [
	| obj |
	obj := aLexiconModelObject isLexiconDirectory
			ifTrue: [ aLexiconModelObject files isEmpty
					ifTrue: [ aLexiconModelObject ]
					ifFalse: [ aLexiconModelObject files first ] ]
			ifFalse: [ aLexiconModelObject ].
	sidebarElement
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
	contentElement
		childNamed: #modificationBar
		ifFound: [ :elmt | 
			elmt
				inUIProcessDo: [ elmt
						background: (lexiconFile isModified
								ifTrue: [ self theme status changesBackgroundColor ]
								ifFalse: [ Color transparent ]) ] ].
	contentElement
		childNamed: #saveButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: lexiconFile isModified ] ].
	contentElement
		childNamed: #cancelButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: lexiconFile isModified ] ]
]

{ #category : #accessing }
GtApLexiconCoder >> updateContentsTo: aLexiconObject [
	| textEditor content toolbar |
	lexiconFile := aLexiconObject lexiconFile.
	lexiconFile announcer weak
		when: GtApLexiconFileSaved
		send: #updateChangeStatus
		to: self.
	contentElement removeChildren.
	contentElement
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
				action: [ lexiconFile saveFile ])
		as: #saveButton.
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons cancel;
				label: 'Cancel';
				action: [ lexiconFile cancel ])
		as: #cancelButton.
	content addChild: toolbar as: #toolbar.
	contentElement addChild: content.
	self updateChangeStatus
]
