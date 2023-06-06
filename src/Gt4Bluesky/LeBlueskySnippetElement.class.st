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
		'imageContainer',
		'parentInfoElement',
		'inspectButton',
		'writingIndicator',
		'cardContainer',
		'embeddedPostContainer'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetElement >> addCard: aCard [
	self snippetViewModel addCard: aCard.
	self updateFileContainer.
	self updateCardContainer.
	self updateEmbeddedPostContainer
]

{ #category : #accessing }
LeBlueskySnippetElement >> addEmbeddedPost: aPost [
	self snippetViewModel addEmbeddedPost: aPost.
	self updateFileContainer.
	self updateCardContainer.
	self updateEmbeddedPostContainer
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
	^ addFileButton := BrButton new beTinySize
			aptitude: BrGlamorousButtonWithIconAptitude new
					+ (BrGlamorousWithDropdownAptitude
							handle: [ BrButton new
									beSmallSize;
									aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonWithLabelTooltipAptitude
											- BrGlamorousButtonExteriorAptitude;
									icon: BrGlamorousVectorIcons add ]
							content: [ BrFileSelector new
									vExact: 250;
									hExact: 400;
									folder: FileLocator home;
									padding: (BlInsets all: 8);
									fileFilterBlock: [ :aFileReference | 
										aFileReference isDirectory not
											and: [ (FileSystemDirectoryEntry reference: aFileReference) isHidden not ] ];
									okAction: [ :aFile | 
										self snippet addFile: aFile.
										self snippetViewModel removeCard.
										self snippetViewModel removeEmbeddedPost.
										addFileButton
											inUIProcessDo: [ addFileButton dispatchEvent: BrDropdownHideWish new ] ] ]);
			icon: BrGlamorousVectorIcons add;
			label: 'Add File'
]

{ #category : #accessing }
LeBlueskySnippetElement >> createCardContainer [
	^ cardContainer := BrHorizontalPane new fitContent
			visibility: BlVisibility gone;
			clipChildren: false;
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets all: 5)
]

{ #category : #accessing }
LeBlueskySnippetElement >> createEmbeddedPostContainer [
	^ embeddedPostContainer := BrHorizontalPane new fitContent
			visibility: BlVisibility gone;
			clipChildren: false;
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets all: 5)
]

{ #category : #accessing }
LeBlueskySnippetElement >> createImageContainer [
	^ imageContainer := BrHorizontalPane new
			hMatchParent;
			vExact: 200;
			visibility: BlVisibility gone;
			clipChildren: false;
			margin: (BlInsets all: 5)
]

{ #category : #accessing }
LeBlueskySnippetElement >> editor [
	"Required by ${method:LeTextualSnippetElement>>#registerFocusEventHandlers}$"
	^ self inputElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> filesToEmbed [
	^ {'$type' -> 'app.bsky.embed.images'.
		'images'
			-> (self snippet fileRecords
					collect: [ :aRecord | 
						{'image' -> (aRecord at: 'blob').
							'alt' -> ''} asDictionary ]) asArray} asDictionary
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
		addEventHandler: (LeEditorReachedBorderEventHandler new snippetElement: self).

	LeSnippetEditorElementShortcuter new
		editor: inputElement;
		indent;
		moveUpAndDown;
		loseFocus.

	contentPane addChild: inputElement as: #editor.

	contentPane addChild: self createImageContainer.
	contentPane addChild: self createCardContainer.
	contentPane addChild: self createEmbeddedPostContainer.

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
			action: [ :aButton | self onPublishAction: aButton ].

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
	self inUIProcessDo: [ self updateFileContainer. self updateCardContainer ]
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
	self updateFileContainer.

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
LeBlueskySnippetElement >> onPublishAction: aButton [
	| record |
	self uploadFiles.
	record := {'$type' -> AppBskyFeedPostMain atpRecordName.
			'createdAt' -> DateAndTime now printString.
			'text' -> inputElement text asString} asDictionary.
			
	self snippet fileRecords
		ifNotEmpty: [ record at: 'embed' put: self filesToEmbed ].
	self snippetViewModel card
		ifNotNil: [ record at: 'embed' put: self cardToEmbed ].
	self snippetViewModel embeddedPost
		ifNotNil: [ record at: 'embed' put: self postToEmbed ].
		
	self links ifNotEmpty: [ record at: 'facets' put: self linksToFacets ].

	self snippet hasParentPost
		ifTrue: [ | root |
			root := ((self snippet client
					appBskyFeedGetPostThreadUri: (self snippet parentPost at: 'uri')
					depth: nil) at: 'thread') client: self snippet client.
			record
				at: 'reply'
				put: {'parent' -> self snippet parentPost.
						'root'
							-> {'uri' -> root atpPost atpUri.
									'cid' -> root atpPost atpCid} asDictionary} asDictionary ].

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
	self updateFileContainer.
	self updateCardContainer
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
LeBlueskySnippetElement >> postToEmbed [
	^ {'$type' -> 'app.bsky.embed.record'.
		'record'
			-> {'uri' -> self snippetViewModel embeddedPost atpPost atpUri.
					'cid' -> self snippetViewModel embeddedPost atpPost atpCid} asDictionary}
		asDictionary
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
LeBlueskySnippetElement >> updateCardContainer [
	cardContainer removeChildren.
	self snippetViewModel card
		ifNil: [ cardContainer visibility: BlVisibility gone ]
		ifNotNil: [ cardContainer visibility: BlVisibility visible.
			cardContainer
				addChild: (GtApExternalElement new model: self snippetViewModel card) ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> updateEmbeddedPostContainer [
	embeddedPostContainer removeChildren.
	self snippetViewModel embeddedPost
		ifNil: [ embeddedPostContainer visibility: BlVisibility gone ]
		ifNotNil: [ embeddedPostContainer visibility: BlVisibility visible.
			embeddedPostContainer
				addChild: (GtApFeedPostSummaryElement new post: self snippetViewModel embeddedPost) ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> updateFileContainer [
	imageContainer removeChildren.
	self snippet files
		ifEmpty: [ imageContainer visibility: BlVisibility gone ]
		ifNotEmpty: [ imageContainer visibility: BlVisibility visible.
			self snippet files
				do: [ :aFile | 
					self snippet database
						attachmentBinaryStream: aFile
						do: [ :aStream | 
							imageContainer
								addChild: (LeBlueskyPostFileWidget new
										vExact: 200;
										hExact: 200;
										contents: aStream contents;
										isDeletable: self snippet hasPost not;
										file: (self snippet database resolveDbFile: aFile);
										onDeletion: [ :aFileForDeletion | self snippet removeFileReference: aFileForDeletion ]) ] ] ]
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
