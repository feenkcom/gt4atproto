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
		'files',
		'fileRecords',
		'imageContainer',
		'parentInfoElement',
		'inspectButton',
		'writingIndicator'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
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
										self files add: aFile.
										addFileButton
											inUIProcessDo: [ addFileButton dispatchEvent: BrDropdownHideWish new.
												self updateFileContainer ] ] ]);
			icon: BrGlamorousVectorIcons add;
			label: 'Add File'
]

{ #category : #accessing }
LeBlueskySnippetElement >> createImageContainer [
	^ imageContainer := BrHorizontalPane new
			hMatchParent;
			vExact: 200;
			visibility: BlVisibility gone;
			margin: (BlInsets all: 5)
]

{ #category : #accessing }
LeBlueskySnippetElement >> editor [
	"Required by ${method:LeTextualSnippetElement>>#registerFocusEventHandlers}$"
	^ self inputElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> fileRecords [
	^ fileRecords
]

{ #category : #accessing }
LeBlueskySnippetElement >> fileRecords: anObject [
	fileRecords := anObject
]

{ #category : #accessing }
LeBlueskySnippetElement >> files [
	^ files
]

{ #category : #accessing }
LeBlueskySnippetElement >> files: anObject [
	files := anObject
]

{ #category : #accessing }
LeBlueskySnippetElement >> filesToEmbed [
	^ {'$type' -> 'app.bsky.embed.images'.
		'images'
			-> (self fileRecords
					collect: [ :aRecord | 
						{'image' -> (aRecord at: 'blob').
							'alt' -> ''} asDictionary ]) asArray} asDictionary
]

{ #category : #accessing }
LeBlueskySnippetElement >> initialize [
	super initialize.


	files := OrderedCollection new.
	fileRecords := OrderedCollection new.

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
	contentElement := BrVerticalPane new
			vFitContentLimited;
			hMatchParent.

	contentElement addChild: self initializeHeader.

	inputElement := BrEditor new
			aptitude: BrGlamorousRegularEditorAptitude;
			vExact: 50.
	inputElement editor
		when: BrTextEditorModifiedEvent
		do: [ :anEvent | 
			writingIndicator
				text: inputElement text size asString , '/' , self maximumPostSize asString.
			self snippet text: inputElement text ].
	inputElement
		addEditorShortcut: (LeSnippetSplitSnippetShortcut new
				combination: (self keyboardShortcut: #SplitSnippet)).

	LeSnippetEditorElementShortcuter new
		editor: inputElement;
		indent;
		moveUpAndDown;
		loseFocus.

	contentElement addChild: inputElement as: #editor.

	contentElement addChild: self createImageContainer.

	contentElement addChild: self initializeToolbarElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> initializeHeader [
	headerElement := BrHorizontalPane new
			hMatchParent;
			vFitContent;
			padding: (BlInsets all: 3).

	headerElement
		addChild: (profilePicture := GtApFeedUserPictureElement new visibility: BlVisibility gone);
		addChild: (authorNameLabel := BrLabel new
					aptitude: BrGlamorousLabelAptitude new;
					visibility: BlVisibility gone);
		addChild: (authorHandleLabel := self buildGrayLabel visibility: BlVisibility gone);
		addChild: (dateLabel := self buildGrayLabel visibility: BlVisibility gone);
		addChild: BrFrame new matchParent;
		addChild: self initializeParentDropdown.

	^ headerElement
]

{ #category : #accessing }
LeBlueskySnippetElement >> initializeParentDropdown [
	^ parentInfoElement := BrButton new
			icon: BrGlamorousIcons spawn;
			visibility: BlVisibility gone;
			label: 'Is Reply';
			aptitude: BrGlamorousButtonWithIconAptitude
					+ (BrGlamorousButtonExteriorAptitude new borderPaint: Color transparent)
					+ (BrGlamorousWithDropdownAptitude
							handle: [ BrButton new
									icon: BrGlamorousIcons spawn;
									aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude ]
							content: [ GtApFeedPostSummaryElement new post: self snippet atpParent ])
							beNotResizable
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
			icon: BrGlamorousIcons spawn;
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
										LeBlueskyIdentityStore default addClient: aClient.
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
LeBlueskySnippetElement >> maximumPostSize [
	^ 300
]

{ #category : #accessing }
LeBlueskySnippetElement >> onClientChanged [
	(self snippet client isNotNil and: [ self snippet client isLoggedIn ])
		ifTrue: [ identityElement label: self snippet client handle.
			publishButton enable ]
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
LeBlueskySnippetElement >> onInspectAction: aButton [
	aButton phlow spawnObject: self snippet atpPost
]

{ #category : #accessing }
LeBlueskySnippetElement >> onPostChanged [
	self updateHeader.

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
	"self uploadFiles."
	record := {'$type' -> AppBskyFeedPostMain atpRecordName.
			'createdAt' -> DateAndTime now printString.
			'text' -> inputElement text asString} asDictionary.
	"self fileRecords ifNotEmpty: [ record at: 'embed' put: self filesToEmbed ]."

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
	self onPostChanged.
	inputElement text: self snippet text
]

{ #category : #accessing }
LeBlueskySnippetElement >> onTextChanged [
	inputElement text: self snippet text.
	writingIndicator label: self snippet text size asString, '/', self maximumPostSize asString
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
		to: self
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
LeBlueskySnippetElement >> updateFileContainer [
	imageContainer removeChildren.
	imageContainer visibility: BlVisibility visible.
	self files
		do: [ :aFile | 
			imageContainer
				addChild: (BrAsyncFileWidget new
						vExact: 200;
						hExact: 200;
						file: aFile) ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> updateHeader [
	| post |
	self snippet hasPost
		ifTrue: [ post := self snippet atpPost.
			post ifNil: [ ^ self ].

			post author
				ifNil: [ authorNameLabel text: '<missing>'.
					authorNameLabel visibility: BlVisibility visible ]
				ifNotNil: [ post author atpAvatar
						ifNotNil: [ profilePicture user: post author.
							profilePicture visibility: BlVisibility visible ].

					post author atpDisplayName
						ifNotNil: [ authorNameLabel text: post author atpDisplayName.
							authorNameLabel visibility: BlVisibility visible ].

					authorHandleLabel text: '@' , post author atpHandle.
					authorHandleLabel visibility: BlVisibility visible.
					dateLabel text: ' at ' , post createdAtTimestamp printToMinute.
					dateLabel visibility: BlVisibility visible ] ]
		ifFalse: [ authorNameLabel visibility: BlVisibility gone.
			authorHandleLabel visibility: BlVisibility gone.
			dateLabel visibility: BlVisibility gone.
			profilePicture visibility: BlVisibility gone ].

	self snippet hasParentPost
		ifTrue: [ parentInfoElement visibility: BlVisibility visible ]
		ifFalse: [ parentInfoElement visibility: BlVisibility gone ]
]

{ #category : #accessing }
LeBlueskySnippetElement >> uploadFiles [
	self files do: [ :aFile | self fileRecords add: (self snippet client comAtprotoRepoUploadBlobFile: aFile) ]
]
