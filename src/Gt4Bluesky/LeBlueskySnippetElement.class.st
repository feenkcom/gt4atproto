Class {
	#name : #LeBlueskySnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'contentElement',
		'inputElement',
		'toolbarElement',
		'errorLabelElement',
		'identityElement',
		'publishButton',
		'replyButton',
		'deleteButton',
		'headerElement',
		'authorNameLabel',
		'authorHandleLabel',
		'dateLabel',
		'profilePicture',
		'addFileButton',
		'parentInfoElement',
		'inspectButton',
		'writingIndicator',
		'embedContainer'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetElement >> addCard: aCard [
	self
		embed: (GtBlueskyCardEmbedding new
				card: aCard;
				snippet: self snippet;
				snippetViewModel: self snippetViewModel)
]

{ #category : #accessing }
LeBlueskySnippetElement >> addEmbeddedPage: aPage [
	self
		embed: (GtBlueskyPageEmbedding new
				page: aPage;
				snippet: self snippet)
]

{ #category : #accessing }
LeBlueskySnippetElement >> addEmbeddedPost: aPost [
	self
		embed: (GtBlueskyPostEmbedding new
				post: aPost;
				snippet: self snippet;
				snippetViewModel: self snippetViewModel)
]

{ #category : #accessing }
LeBlueskySnippetElement >> asBlueskyRecord [
	| record |
	record := {'$type' -> AppBskyFeedPostMain atpRecordName.
			'createdAt' -> DateAndTime now printString.
			'text' -> inputElement text asString} asDictionary.

	self snippetViewModel embed
		ifNotNil: [ :anEmbed | record at: 'embed' put: anEmbed asJson ].

	self links ifNotEmpty: [ record at: 'facets' put: self linksToFacets ].

	self snippet hasParentPost
		ifTrue: [ | root |
			root := (((self snippet client
					appBskyFeedGetPostThreadUri: (self snippet parentPost at: 'uri')
					depth: nil
					parentHeight: nil) at: 'thread') client: self snippet client) getRootPost.
			record
				at: 'reply'
				put: {'parent' -> self snippet parentPost.
						'root'
							-> {'uri' -> root atpPost atpUri.
									'cid' -> root atpPost atpCid} asDictionary} asDictionary ].
	record.
	^ record
]

{ #category : #accessing }
LeBlueskySnippetElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #accessing }
LeBlueskySnippetElement >> cardToEmbed [
	| externalDictionary tempfile thumbUrl fileReference blob |
	externalDictionary := {'description' -> self snippetViewModel card description.
			'title' -> self snippetViewModel card title.
			'uri' -> self snippetViewModel card url} asDictionary.

	self snippetViewModel card thumb
		ifNotNil: [ thumbUrl := self snippetViewModel card thumb asZnUrl.
			tempfile := Smalltalk imageDirectory / thumbUrl file.
			tempfile ensureDelete.
			fileReference := thumbUrl saveContentsToFile: tempfile.
			blob := self snippet client comAtprotoRepoUploadBlobFile: fileReference.
			externalDictionary
				at: 'thumb'
				put: ((blob at: 'blob') union: {'$type' -> 'blob'} asDictionary).
			tempfile ensureDelete ].

	^ {'$type' -> 'app.bsky.embed.external'.
		'external' -> externalDictionary} asDictionary
]

{ #category : #accessing }
LeBlueskySnippetElement >> contentElement [
	<return: #BrFrame>
	^ contentElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> createAddFileButton [
	^ addFileButton := BrToggleGroup new
			aptitude: BrGlamorousToggleGroupAptitude new;
			addToggle: (BrToggle new
					aptitude: BrGlamorousToggleWithLabelAptitude new
							+ (BrGlamorousWithDropdownAptitude
									handle: [ BrToggle new
											aptitude: BrGlamorousToggleWithLabelAptitude;
											label: 'Pictures' ]
									content: [ BrFileSelector new
											folder: FileLocator home;
											fileFilterBlock: [ :aFileReference | aFileReference isFile and: [ GtFileUtility isImageFile: aFileReference ] ];
											okAction: [ :aFile | 
												self
													embed: (GtBlueskyPictureEmbedding new
															snippet: self snippet;
															file: aFile).
												addFileButton dispatchEvent: BrDropdownHideWish new ] ]);
					label: 'Pictures');
			addToggle: (BrToggle new
					aptitude: BrGlamorousToggleWithLabelAptitude new
							+ (BrGlamorousWithDropdownAptitude
									handle: [ BrToggle new
											aptitude: BrGlamorousToggleWithLabelAptitude;
											label: 'Video' ]
									content: [ BrFileSelector new
											folder: FileLocator home;
											fileFilterBlock: [ :aFileReference | 
												aFileReference isFile
													and: [ GtFileUtility doesFile: aFileReference haveExtension: #('mp4' #'.' 'mov') ] ];
											okAction: [ :aFile | 
												self
													embed: (GtBlueskyVideoEmbedding new
															snippet: self snippet;
															file: aFile).
												addFileButton dispatchEvent: BrDropdownHideWish new ] ]);
					label: 'Video');
			addToggle: (BrToggle new
					aptitude: BrGlamorousToggleWithLabelAptitude new
							+ (BrGlamorousWithDropdownAptitude
									handle: [ BrToggle new
											aptitude: BrGlamorousToggleWithLabelAptitude;
											label: 'Page' ]
									content: [ GtStreamingSpotterElement new
											spotter: ((GtSpotter on: LeBlueskySpotterStart new)
													when: GtSpotterObjectActOn
														send: #addEmbeddedPage:
														to: self;
													yourself);
											size: 600 @ 400 ]);
					label: 'Page')
]

{ #category : #accessing }
LeBlueskySnippetElement >> createEmbedContainer [
	^ embedContainer := BrHorizontalPane new fitContent
]

{ #category : #accessing }
LeBlueskySnippetElement >> editor [
	"Required by ${method:LeTextualSnippetElement>>#registerFocusEventHandlers}$"
	^ self inputElement
]

{ #category : #'as yet unclassified' }
LeBlueskySnippetElement >> embed: anEmbedding [
	self snippetViewModel embed: anEmbedding.
	self updateEmbeds
]

{ #category : #accessing }
LeBlueskySnippetElement >> filesToEmbed [
	(self snippet files allSatisfy: [ :aFile | GtFileUtility isImageFile: aFile ])
		ifTrue: [ ^ {'$type' -> 'app.bsky.embed.images'.
				'images'
					-> (self snippet fileRecords
							collect: [ :aRecord | 
								{'image' -> (aRecord at: 'blob').
									'alt' -> ''} asDictionary ]) asArray} asDictionary ].

	^ {'$type' -> 'app.bsky.embed.video'.
		'video' -> (self snippet fileRecords first at: 'blob')} asDictionary
]

{ #category : #views }
LeBlueskySnippetElement >> gtRecordFor: aView [
	<gtView>
	^ aView forward
		title: 'AT Record';
		priority: 0.5;
		object: [ self asBlueskyRecord ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
LeBlueskySnippetElement >> initialize [
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

{ #category : #accessing }
LeBlueskySnippetElement >> initializeContentElement [
	| contentPane contentWrapper |
	contentElement := BrVerticalPane new vFitContentLimited hMatchParent.

	contentWrapper := BrHorizontalPane new vFitContentLimited hMatchParent.

	contentElement addChild: contentWrapper.

	contentWrapper
		addChild: (profilePicture := GtApFeedUserPictureElement new
					visibility: BlVisibility gone;
					padding: (BlInsets all: 3)).

	contentPane := BrVerticalPane new
			vFitContentLimited;
			hMatchParent.

	contentWrapper addChild: contentPane.

	contentPane addChild: self initializeHeader.

	inputElement := BrEditor new
			aptitude: BrGlamorousRegularEditorAptitude;
			hMatchParent;
			styler: (GtApPostStyler new snippetElement: self);
			vFitContent.
	inputElement editor
		when: BrTextEditorModifiedEvent
		do: [ :anEvent | 
			writingIndicator
				text: inputElement text size asString , '/' , self maximumPostSize asString.
			self snippet string: inputElement text asString ].

	inputElement
		addEditorShortcut: (LeSnippetSplitSnippetShortcut new
				combination: (self keyboardShortcut: #SplitSnippet));
		addEditorShortcut: (LeSnippetDeletePreviousShortcut new
				combination: (self keyboardShortcut: #DeletePrevious));
		addEditorShortcut: (LeSnippetDeleteNextShortcut new
				combination: (self keyboardShortcut: #DeleteNext)).

	inputElement editor
		inputFilter: (GtBlueskySnippetPageFilter new snippetElement: self).

	inputElement editor
		addEventHandler: (LeEditorReachedBorderEventHandler new snippetElement: self).

	LeSnippetEditorElementShortcuter new
		editor: inputElement;
		indent;
		moveUpAndDown;
		loseFocus.

	contentPane addChild: inputElement as: #editor.

	contentPane addChild: self createEmbedContainer.

	contentElement addChild: self initializeToolbarElement.

	contentElement addChild: self initializeParentDropdown
]

{ #category : #accessing }
LeBlueskySnippetElement >> initializeHeader [
	headerElement := BrHorizontalPane new
			hMatchParent;
			vFitContent;
			padding: (BlInsets all: 3).

	headerElement
		addChild: (authorNameLabel := BrLabel new
					aptitude: BrGlamorousLabelAptitude new;
					visibility: BlVisibility gone);
		addChild: (authorHandleLabel := self buildGrayLabel visibility: BlVisibility gone);
		addChild: (dateLabel := self buildGrayLabel visibility: BlVisibility gone).

	^ headerElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> initializeParentDropdown [
	^ parentInfoElement := BrButton new
			icon: (BrGlamorousVectorIcons spawn asElement
					background: BrGlamorousColors disabledButtonTextColor);
			label: 'Reply Information';
			aptitude: BrGlamorousButtonWithIconAptitude
					+ (BrGlamorousButtonExteriorAptitude new borderPaint: Color transparent)
					+ (BrGlamorousWithDropdownAptitude
							handle: [ BrButton new
									icon: BrGlamorousVectorIcons spawn;
									aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude ]
							content: [ self snippet hasParentPost
									ifTrue: [ GtApReplyElement new snippet: self snippet ]
									ifFalse: [ GtApAddReplyForm new
											isReadOnly: self snippet hasPost;
											onAccept: [ :aUrl | 
												self snippet parentFromUrl: aUrl.
												self dispatchEvent: BrDropdownHideWish new ] ] ]) beNotResizable;
			constraintsDo: [ :c | 
				c ignoreByLayout.
				c ignored horizontal alignRight.
				c ignored vertical alignTop ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> initializeToolbarElement [
	| toolbarContainer |
	toolbarContainer := BrHorizontalPane new vFitContent hMatchParent.

	toolbarElement := BrToolbar new
			aptitude: BrGlamorousToolbarAptitude;
			hMatchParent;
			vFitContent;
			visibility: BlVisibility hidden.

	toolbarContainer addChild: toolbarElement.

	publishButton := BrButton new
			beTinySize;
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons accept;
			label: 'Publish';
			disable;
			action: [ :aButton | self publishPost ].

	toolbarElement addItem: publishButton.

	toolbarElement addItem: self createAddFileButton.

	writingIndicator := BrLabel new
			beTinySize;
			aptitude: (BrGlamorousLabelAptitude new foreground: Color lightGray);
			text: '0/' , self maximumPostSize asString.

	toolbarElement addItem: writingIndicator.

	replyButton := BrButton new
			beTinySize;
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons spawn;
			label: 'Reply';
			visibility: BlVisibility gone;
			action: [ :aButton | self onReplyAction: aButton ].

	toolbarElement addItem: replyButton.

	deleteButton := BrButton new
			beTinySize;
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons cancel;
			label: 'Delete';
			visibility: BlVisibility gone;
			action: [ :aButton | self onDeleteAction: aButton ].

	toolbarElement addItem: deleteButton.

	inspectButton := BrButton new
			beTinySize;
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons inspect;
			label: 'Inspect';
			visibility: BlVisibility gone;
			action: [ :aButton | self onInspectAction: aButton ].

	toolbarElement addItem: inspectButton.

	errorLabelElement := BrLabel new
			id: LeGitHubErrorMessageElementId;
			aptitude: (BrGlamorousLabelAptitude new foreground: BrGlamorousColors errorBackgroundColor);
			text: '';
			vFitContentLimited;
			vFitContent;
			hMatchParent.

	toolbarElement addItem: errorLabelElement.

	identityElement := BrButton new
			label: 'Login';
			aptitude: BrGlamorousButtonRectangularAptitude new
					+ (BrGlamorousButtonExteriorAptitude new borderPaint: Color transparent)
					+ (BrGlamorousButtonLabelAptitude new defaultColor: Color lightGray)
					+ (BrGlamorousWithDropdownAptitude
							handle: [ BrButton new
									label: 'Login';
									aptitude: BrGlamorousButtonWithLabelAptitude - BrGlamorousButtonExteriorAptitude ]
							content: [ LeBlueksyAccountSwitcherElement new
									currentlySelected: self snippet client;
									onSelection: [ :aClient | 
										self snippet client: aClient.
										identityElement
											inUIProcessDo: [ identityElement dispatchEvent: BrDropdownHideWish new ] ] ]).

	toolbarContainer addChild: identityElement.

	^ toolbarContainer
]

{ #category : #accessing }
LeBlueskySnippetElement >> inputElement [
	^ inputElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> inputElement: anObject [
	inputElement := anObject
]

{ #category : #accessing }
LeBlueskySnippetElement >> linkToFeature: aString [
	^ (aString beginsWith: '@')
		ifTrue: [ {'$type' -> 'app.bsky.richtext.facet#mention'.
				'did' -> (self lookupUserDid: aString allButFirst)} asDictionary ]
		ifFalse: [ {'$type' -> 'app.bsky.richtext.facet#link'.
				'uri'
					-> ((aString beginsWith: 'http')
							ifTrue: [ aString ]
							ifFalse: [ 'https://' , aString ])} asDictionary ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> links [
	| text result |
	text := inputElement text.
	result := OrderedCollection new.
	text
		attributeRunsDo: [ :from :to :attrs | 
			attrs
				do: [ :each | 
					(each isKindOf: GtApPostLinkAttribute)
						ifTrue: [ result add: {from. to. (text from: from to: to)} ] ] ].
	^ result
]

{ #category : #accessing }
LeBlueskySnippetElement >> linksToFacets [
	^ (self links
		collect: [ :aLinkDefinition | 
			{'index'
					-> {'byteStart' -> (aLinkDefinition first - 1).
							'byteEnd' -> aLinkDefinition second} asDictionary.
				'features'
					-> {self linkToFeature: aLinkDefinition third asString}} asDictionary ])
		asArray
]

{ #category : #accessing }
LeBlueskySnippetElement >> lookupUserDid: aHandle [
	^ (self snippet client comAtprotoIdentityResolveHandleHandle: aHandle)
		at: 'did'
]

{ #category : #accessing }
LeBlueskySnippetElement >> maximumPostSize [
	^ 300
]

{ #category : #accessing }
LeBlueskySnippetElement >> onClientChanged [
	(self snippet client isNotNil and: [ self snippet client isLoggedIn ])
		ifTrue: [ identityElement label: self snippet client handle.
			publishButton enable ].
			
	self onPostChanged
]

{ #category : #accessing }
LeBlueskySnippetElement >> onCursorChanged [
	inputElement
		inUIProcessDo: [ inputElement navigator
				removeAll;
				addAll: self snippetViewModel cursor;
				apply ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> onDeleteAction: aButton [
	self snippet client
		comAtprotoRepoDeleteRecordRepo: self snippet actor atpDid
		collection: AppBskyFeedPostMain atpRecordName
		rkey: (#/ split: (self snippet post at: 'uri')) last
		swapRecord: nil
		swapCommit: nil.
	self snippet post: nil
]

{ #category : #accessing }
LeBlueskySnippetElement >> onFilesChanged [
	self inUIProcessDo: [ self updateEmbeds ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> onInspectAction: aButton [
	aButton phlow spawnObject: self snippet atpPost
]

{ #category : #accessing }
LeBlueskySnippetElement >> onPostChanged [
	(self snippet hasPost not or: [ self snippet post includesKey: 'uri' ])
		ifTrue: [ errorLabelElement text: '' ]
		ifFalse: [ errorLabelElement text: 'Malformed post in snippet definition'.

			^ self ].

	self updateHeader.
	self updateEmbeds.

	self snippet hasPost
		ifTrue: [ publishButton visibility: BlVisibility gone.
			addFileButton visibility: BlVisibility gone.
			writingIndicator visibility: BlVisibility gone.
			identityElement visibility: BlVisibility gone.
			replyButton visibility: BlVisibility visible.
			deleteButton visibility: BlVisibility visible.
			inspectButton visibility: BlVisibility visible.
			inputElement beReadOnlyWithSelection ]
		ifFalse: [ publishButton visibility: BlVisibility visible.
			addFileButton visibility: BlVisibility visible.
			writingIndicator visibility: BlVisibility visible.
			identityElement visibility: BlVisibility visible.
			replyButton visibility: BlVisibility gone.
			deleteButton visibility: BlVisibility gone.
			inspectButton visibility: BlVisibility gone.
			inputElement beEditable ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> onReplyAction: aButton [
	self snippet
		addSnippetAfterSelf: (LeBlueskySnippet empty
				client: self snippet client;
				parentPost: self snippet post).
	self snippetViewModel focusNextSnippet
]

{ #category : #accessing }
LeBlueskySnippetElement >> onSnippetViewModelChanged [
	super onSnippetViewModelChanged.
	self onClientChanged.
	inputElement text: self snippet text.
	self updateEmbeds
]

{ #category : #accessing }
LeBlueskySnippetElement >> onSnippetViewModelFocused: aBoolean [
	"Override me to either request or lose focus depending on the boolean"

	aBoolean
		ifTrue: [ inputElement requestFocus ]
		ifFalse: [ inputElement loseFocus ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> onTextChanged [
	inputElement
		inUIProcessDo: [ inputElement text: self snippet text.
			writingIndicator
				text: self snippet text size asString , '/' , self maximumPostSize asString ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> pageToEmbed [
	^ {'$type' -> 'com.gtoolkit.embed.lepiterPage'.
		'record'
			-> (LeJsonV4 uniqueInstance serialize: self snippetViewModel embeddedPage)}
		asDictionary
]

{ #category : #accessing }
LeBlueskySnippetElement >> postToEmbed [
	^ {'$type' -> 'app.bsky.embed.record'.
		'record'
			-> {'uri' -> self snippetViewModel embeddedPost atpPost atpUri.
					'cid' -> self snippetViewModel embeddedPost atpPost atpCid} asDictionary}
		asDictionary
]

{ #category : #accessing }
LeBlueskySnippetElement >> publishPost [
	| record |
	self uploadFiles.
	record := self asBlueskyRecord.
	self snippet
		post: (self snippet client
				comAtprotoRepoCreateRecordRepo: self snippet actor atpDid
				collection: AppBskyFeedPostMain atpRecordName
				rkey: nil
				validate: nil
				record: record
				swapCommit: nil).
	self transformLaterSnippetsFrom: self snippet
]

{ #category : #accessing }
LeBlueskySnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place within snippet element depending on the
	View Model properties and derived look"
	<return: #BlElement>

	^ self contentElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> snippetToolbar [
	"Return an element that represents a toolbar of the snippet. A toolbar usually appears below the snippet content.
	The embedder is responsible for placing #snippetToolbar in the right place within snippet element depending on the
	View Model properties and derived look.
	If returned #snippetToolbar is nil, no toolbar will be added"
	<return: #BlElement or: nil>

	^ nil
]

{ #category : #accessing }
LeBlueskySnippetElement >> subscribeToSnippetViewModel [
	super subscribeToSnippetViewModel.

	self snippetViewModel
		when: LeBlueskySnippetClientChanged
		send: #onClientChanged
		to: self.

	self snippetViewModel
		when: LeBlueskySnippetPostChanged
		send: #onPostChanged
		to: self.

	self snippetViewModel
		when: LeBlueskySnippetTextChanged
		send: #onTextChanged
		to: self.

	self snippetViewModel
		when: LeBlueskySnippetCursorChanged
		send: #onCursorChanged
		to: self.
		
	self snippetViewModel
		when: LeBlueskySnippetFilesChanged
		send: #onFilesChanged
		to: self
]

{ #category : #accessing }
LeBlueskySnippetElement >> textToLink: aString [
	^ (aString beginsWith: '@')
		ifTrue: [ 'https://bsky.app/profile/' , aString allButFirst ]
		ifFalse: [ aString ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> toolbarElement [
	<return: #BrToolbar>
	^ toolbarElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> transformLaterSnippetsFrom: aSnippet [
	aSnippet
		nextSnippetDo: [ :nextSnippet | 
			(nextSnippet isKindOf: LeBlueskySnippet)
				ifTrue: [ nextSnippet parentPost: self snippet post ].
			self transformLaterSnippetsFrom: nextSnippet ]
		ifNone: [  ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> updateEmbeds [
	embedContainer removeChildren.

	self snippetViewModel embed
		ifNotNil: [ :anEmbed | embedContainer addChild: anEmbed asElement ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> updateHeader [
	| post |
	self snippet hasPost
		ifTrue: [ post := self snippet post.
			(post at: 'avatar')
				ifNotNil: [ profilePicture avatar: (post at: 'avatar').
					profilePicture visibility: BlVisibility visible ].

			(post at: 'displayName')
				ifNotNil: [ authorNameLabel text: (post at: 'displayName').
					authorNameLabel visibility: BlVisibility visible ].

			authorHandleLabel text: '@' , (post at: 'handle').
			authorHandleLabel visibility: BlVisibility visible.
			dateLabel
				text: ' at ' , (DateAndTime fromString: (post at: 'timeStamp')) printToMinute.
			dateLabel visibility: BlVisibility visible ]
		ifFalse: [ authorNameLabel visibility: BlVisibility gone.
			authorHandleLabel visibility: BlVisibility gone.
			dateLabel visibility: BlVisibility gone.
			profilePicture visibility: BlVisibility gone ].

	self snippet hasParentPost
		ifTrue: [ parentInfoElement icon background: Color black ]
		ifFalse: [ parentInfoElement icon background: BrGlamorousColors disabledButtonTextColor ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> uploadFiles [
	self snippet fileReferences
		do: [ :aFile | 
			self snippet fileRecords
				add: (self snippet client comAtprotoRepoUploadBlobFile: aFile) ]
]
