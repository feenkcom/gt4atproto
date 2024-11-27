Class {
	#name : #LeBlueskyLinkSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'urlEditorElement',
		'postElement',
		'contentElement',
		'toolbarContainer'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initialize [
	super initialize.

	self initializeContentElement.
	self initializeToolbarElement.

	self
		addAptitude: (BrLazyStyleCommonAptitude new
				when: BlElementState focused | BlElementState hovered
				style: [ :aStyle | 
					aStyle
						do: [ toolbarElement visibility: BlVisibility visible ]
						after: [ toolbarElement visibility: BlVisibility hidden ] ]).

	self padding: (BlInsets all: 5)
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeContentElement [
	contentElement := BrVerticalPane new vFitContentLimited hMatchParent.

	contentElement addChild: self initializePostElement.
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializePostElement [
	^ postElement := GtApFeedPostSummaryElement new
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> initializeToolbarElement [
	| urlContainer |
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
		constraintsDo: [ :c | 
			c grid vertical alignCenter ].

	urlEditorElement := BrEditor new
		id: LePictureSnippetUrlEditorElementId;
		aptitude: BrGlamorousRegularEditorAptitude new glamorousRegularSmallSize + BrGlamorousInputFieldSpacingAptitude new;
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

	urlContainer
		addChild: urlEditorElement.
		
	toolbarContainer 
		addChild: (BrLabel new
			aptitude: (BrGlamorousLabelAptitude new foreground: BrGlamorousColors disabledButtonTextColor);
			beSmallSize;
			text: 'URL:';
			constraintsDo: [ :c | 
				c grid vertical alignCenter ]);
		addChild: urlContainer.

	^ toolbarContainer
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetElement >> onSnippetViewModelChanged [
	self updateElement
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

	self snippetViewModel post
		ifNotNil: [ postElement post: self snippetViewModel post ]
]
