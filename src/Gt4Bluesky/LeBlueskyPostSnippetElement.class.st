Class {
	#name : #LeBlueskyPostSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'toolbarElement',
		'urlEditorElement',
		'postElement',
		'contentElement'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> initialize [
	super initialize.

	self initializeContentElement.

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
LeBlueskyPostSnippetElement >> initializeContentElement [
	contentElement := BrVerticalPane new vFitContentLimited hMatchParent.

	contentElement addChild: self initializePostElement.

	contentElement addChild: self initializeToolbarElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> initializePostElement [
	postElement := GtApFeedPostSummaryElement new
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> initializeToolbarElement [
	| toolbarContainer urlContainer |
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
LeBlueskyPostSnippetElement >> onSnippetViewModelChanged [
	self updateElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> onURLModifiedEvent: anEvent [ 
	self snippetViewModel url: urlEditorElement url.
	
	self updateElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place within snippet element depending on the
	View Model properties and derived look"
	<return: #BlElement>

	^ contentElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> snippetToolbar [
	^ toolbarElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetElement >> updateElement [
	urlEditorElement text: self snippetViewModel url.
	
	postElement post: self snippetViewModel post
]
