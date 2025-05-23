Class {
	#name : #LeBlueskyLinkSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'urlEditorElement',
		'postElement',
		'contentElement',
		'toolbarContainer',
		'deleteButton',
		'parentDropdown',
		'loginElement'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> addReplyElement [
	self snippet
		addSnippetAfterSelf: (LeBlueskyPostSnippet new parentFromUrl: self snippetViewModel url)
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> editor [
	^ urlEditorElement
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initialize [
	super initialize.

	self initializeContentElement.
	self initializeToolbarElement.

	self padding: (BlInsets all: 5)
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeContentElement [
	contentElement := BrVerticalPane new vFitContentLimited hMatchParent.

	contentElement addChild: self initializePostElement.
	contentElement addChild: self initializeLoginElement.
	contentElement addChild: self initializeParentButton
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeLoginElement [
	^ loginElement := (GtBlueskyLoginForm new
			clientCallback: [ :aClient | 
				self snippet client: aClient.
				self onSnippetViewModelChanged ]) asElement
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeParentButton [
	^ parentDropdown := BrButton new
			icon: BrGlamorousVectorIcons spawn asElement;
			label: 'Reply Information';
			aptitude: BrGlamorousButtonWithIconAptitude
					+ (BrGlamorousButtonExteriorAptitude new borderPaint: Color transparent);
			action: [ self phlow spawnObject: self snippetViewModel parent ];
			constraintsDo: [ :c | 
				c ignoreByLayout.
				c ignored horizontal alignRight.
				c ignored vertical alignTop ]
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializePostElement [
	^ postElement := GtApFeedPostSummaryElement new
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeToolbarElement [
	| urlContainer toolbarElement |
	toolbarContainer := BrHorizontalPane new vFitContent hMatchParent.

	toolbarElement := BrToolbar new
			aptitude: BrGlamorousToolbarAptitude;
			hMatchParent;
			vFitContent;
			visibility: BlVisibility hidden.

	toolbarContainer addChild: toolbarElement.

	urlContainer := BrHorizontalPane new
			hMatchParent;
			alignCenterLeft;
			vFitContent;
			constraintsDo: [ :c | c grid vertical alignCenter ].

	urlEditorElement := BrEditor new
			id: LePictureSnippetUrlEditorElementId;
			aptitude: BrGlamorousRegularEditorAptitude new glamorousRegularSmallSize
					+ BrGlamorousInputFieldSpacingAptitude new;
			vFitContent;
			hMatchParent;
			margin: (BlInsets right: 3);
			constraintsDo: [ :c | c minWidth: 100 ].

	urlEditorElement editor
		when: BrTextEditorModifiedEvent
		do: [ :anEvent | self onURLModifiedEvent: anEvent ].

	LeSnippetEditorElementShortcuter new
		editor: urlEditorElement;
		indent;
		moveUpAndDown;
		loseFocus.

	urlContainer addChild: urlEditorElement.

	toolbarContainer
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new
						foreground: BrGlamorousColors disabledButtonTextColor);
				beSmallSize;
				text: 'URL:';
				constraintsDo: [ :c | c grid vertical alignCenter ]);
		addChild: urlContainer.
		
	toolbarContainer
		addChild: (BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousVectorIcons spawn;
					label: 'Reply to post';
					action: [ self enqueueTask: (BlTaskAction new action: [ self addReplyElement ]) ]).

	toolbarContainer
		addChild: (deleteButton := BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousVectorIcons cancel;
					label: 'Delete post';
					visibility: BlVisibility gone;
					action: [ self snippetViewModel deletePost.
						self enqueueTask: (BlTaskAction new action: [ self updateElement ]) ]).

	^ toolbarContainer
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> onSnippetViewModelChanged [
	self enqueueTask: (BlTaskAction new action: [ self updateElement ])
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> onURLModifiedEvent: anEvent [
	self snippetViewModel url: urlEditorElement text asString.

	self enqueueTask: (BlTaskAction new action: [ self updateElement ])
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place within snippet element depending on the
	View Model properties and derived look"
	<return: #BlElement>

	^ contentElement
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> snippetToolbar [
	^ toolbarContainer
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> updateElement [
	urlEditorElement text: self snippetViewModel url.

	postElement post: self snippetViewModel post.

	self snippetViewModel parent
		ifNil: [ parentDropdown visibility: BlVisibility gone ]
		ifNotNil: [ parentDropdown visibility: BlVisibility visible ].

	self snippetViewModel isOwnPost
		ifTrue: [ deleteButton visibility: BlVisibility visible ]
		ifFalse: [ deleteButton visibility: BlVisibility gone ].

	self snippetViewModel client
		ifNil: [ loginElement visibility: BlVisibility visible.
			postElement visibility: BlVisibility gone ]
		ifNotNil: [ loginElement visibility: BlVisibility gone.
			postElement visibility: BlVisibility visible ]
]
