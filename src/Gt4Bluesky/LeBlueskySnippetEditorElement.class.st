Class {
	#name : #LeBlueskySnippetEditorElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'contentElement',
		'inputElement',
		'toolbarElement',
		'errorLabelElement',
		'identityElement',
		'publishButton',
		'replyButton',
		'addFileButton',
		'parentInfoElement',
		'inspectButton',
		'writingIndicator',
		'embedContainer'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetEditorElement >> addCard: aCard [
	self
		embed: (GtBlueskyCardEmbedding new
				card: aCard;
				snippet: self snippet;
				snippetViewModel: self snippetViewModel)
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> addEmbeddedPage: anEvent [
	self
		embed: (GtBlueskyPageEmbedding new
				page: anEvent rawObject;
				snippet: self snippet)
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> addEmbeddedPost: aPost [
	self
		embed: (GtBlueskyPostEmbedding new
				post: aPost;
				snippet: self snippet;
				snippetViewModel: self snippetViewModel)
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> asBlueskyRecord [
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
LeBlueskySnippetEditorElement >> cardToEmbed [
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
LeBlueskySnippetEditorElement >> contentElement [
	<return: #BrFrame>
	^ contentElement
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> createAddFileButton [
	| fileSelector |
	^ addFileButton := BrToggleGroup new
			aptitude: BrGlamorousToggleGroupAptitude new;
			addToggle: (BrToggle new
					aptitude: BrGlamorousToggleWithLabelAptitude new
							+ (BrGlamorousWithDropdownAptitude
									handle: [ BrToggle new
											aptitude: BrGlamorousToggleWithLabelAptitude;
											label: 'Pictures' ]
									content: [ fileSelector := BrFileSelector new
												folder: FileLocator home;
												fileFilterBlock: [ :aFileReference | aFileReference isFile and: [ GtFileUtility isImageFile: aFileReference ] ];
												okAction: [ :aFile | 
													self
														embed: (GtBlueskyPictureEmbedding new
																snippetViewModel: self snippetViewModel;
																snippet: self snippet;
																addFile: aFile).
													fileSelector
														inUIProcessDo: [ fileSelector fireEvent: BrDropdownHideWish new ] ] ]);
					label: 'Pictures');
			addToggle: (BrToggle new
					aptitude: BrGlamorousToggleWithLabelAptitude new
							+ (BrGlamorousWithDropdownAptitude
									handle: [ BrToggle new
											aptitude: BrGlamorousToggleWithLabelAptitude;
											label: 'Video' ]
									content: [ fileSelector := BrFileSelector new
												folder: FileLocator home;
												fileFilterBlock: [ :aFileReference | 
													aFileReference isFile
														and: [ GtFileUtility doesFile: aFileReference haveExtension: {'mp4'. 'mov'} ] ];
												okAction: [ :aFile | 
													self
														embed: (GtBlueskyVideoEmbedding new
																snippetViewModel: self snippetViewModel;
																snippet: self snippet;
																file: aFile).
													fileSelector
														inUIProcessDo: [ fileSelector fireEvent: BrDropdownHideWish new ] ] ]);
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
LeBlueskySnippetEditorElement >> createEmbedContainer [
	^ embedContainer := BrHorizontalPane new fitContent
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> editor [
	"Required by ${method:LeTextualSnippetElement>>#registerFocusEventHandlers}$"
	^ self inputElement
]

{ #category : #'as yet unclassified' }
LeBlueskySnippetEditorElement >> embed: anEmbedding [
	self snippetViewModel embed: anEmbedding.
	self updateEmbeds
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> filesToEmbed [
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
LeBlueskySnippetEditorElement >> gtRecordFor: aView [
	<gtView>
	^ aView forward
		title: 'AT Record';
		priority: 0.5;
		object: [ self asBlueskyRecord ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> initialize [
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
LeBlueskySnippetEditorElement >> initializeContentElement [
	| contentPane contentWrapper |
	contentElement := BrVerticalPane new vFitContentLimited hMatchParent.

	contentWrapper := BrHorizontalPane new vFitContentLimited hMatchParent.

	contentElement addChild: contentWrapper.

	contentPane := BrVerticalPane new
			vFitContentLimited;
			hMatchParent.

	contentWrapper addChild: contentPane.

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
		inputFilter: (GtBlueskySnippetEditorPageFilter new snippetElement: self).

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
LeBlueskySnippetEditorElement >> initializeParentDropdown [
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
							content: [ | anElement |
								anElement := self snippet hasParentPost
										ifTrue: [ GtApReplyElement new snippet: self snippet ]
										ifFalse: [ GtApAddReplyForm new
												isReadOnly: self snippet hasPost;
												onAccept: [ :aUrl | 
													self snippet parentFromUrl: aUrl.
													anElement
														inUIProcessDo: [ anElement fireEvent: BrDropdownHideWish new ] ];
												asElement ] ]) beNotResizable;
			constraintsDo: [ :c | 
				c ignoreByLayout.
				c ignored horizontal alignRight.
				c ignored vertical alignTop ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> initializeToolbarElement [
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
LeBlueskySnippetEditorElement >> inputElement [
	^ inputElement
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> inputElement: anObject [
	inputElement := anObject
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> linkToFeature: aString [
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
LeBlueskySnippetEditorElement >> links [
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
LeBlueskySnippetEditorElement >> linksToFacets [
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
LeBlueskySnippetEditorElement >> lookupUserDid: aHandle [
	^ (self snippet client comAtprotoIdentityResolveHandleHandle: aHandle)
		at: 'did'
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> maximumPostSize [
	^ 300
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onClientChanged [
	(self snippet client isNotNil and: [ self snippet client isLoggedIn ])
		ifTrue: [ identityElement label: self snippet client handle.
			publishButton enable ].

	self onPostChanged
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onCursorChanged [
	inputElement
		inUIProcessDo: [ inputElement navigator
				removeAll;
				addAll: self snippetViewModel cursor;
				apply ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onFilesChanged [
	self inUIProcessDo: [ self updateEmbeds ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onPostChanged [
	self updateHeader.
	self updateEmbeds
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onReplyAction: aButton [
	self snippet
		addSnippetAfterSelf: (LeBlueskyEditorSnippet empty
				client: self snippet client;
				parentPost: self snippet post).
	self snippetViewModel focusNextSnippet
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onSnippetViewModelChanged [
	super onSnippetViewModelChanged.
	self onClientChanged.
	inputElement text: self snippet text.
	self updateEmbeds
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onSnippetViewModelFocused: aBoolean [
	"Override me to either request or lose focus depending on the boolean"

	aBoolean
		ifTrue: [ inputElement requestFocus ]
		ifFalse: [ inputElement loseFocus ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> onTextChanged [
	inputElement
		inUIProcessDo: [ inputElement text: self snippet text.
			writingIndicator
				text: self snippet text size asString , '/' , self maximumPostSize asString ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> publishPost [
	| record post |
	self uploadFiles.
	record := self asBlueskyRecord.
	post := (self snippet client
				comAtprotoRepoCreateRecordRepo: self snippetViewModel actor atpDid
				collection: AppBskyFeedPostMain atpRecordName
				rkey: nil
				validate: nil
				record: record
				swapCommit: nil).
	self transformLaterSnippetsFrom: self snippet withPost: post.
	self transformSnippetUsingPost: post
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place within snippet element depending on the
	View Model properties and derived look"
	<return: #BlElement>

	^ self contentElement
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> snippetToolbar [
	"Return an element that represents a toolbar of the snippet. A toolbar usually appears below the snippet content.
	The embedder is responsible for placing #snippetToolbar in the right place within snippet element depending on the
	View Model properties and derived look.
	If returned #snippetToolbar is nil, no toolbar will be added"
	<return: #BlElement or: nil>

	^ nil
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> subscribeToSnippetViewModel [
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
LeBlueskySnippetEditorElement >> toolbarElement [
	<return: #BrToolbar>
	^ toolbarElement
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> transformLaterSnippetsFrom: aSnippet withPost: aPost [
	aSnippet
		nextSnippetDo: [ :nextSnippet | 
			(nextSnippet isKindOf: LeBlueskyEditorSnippet)
				ifTrue: [ nextSnippet parentPost: aPost ].
			self transformLaterSnippetsFrom: nextSnippet withPost: aPost ]
		ifNone: [  ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> transformSnippetUsingPost: aPost [
	self snippet
		addSnippetAfterSelf: (LeBlueskyPostSnippet new
				url: 'https://bsky.app/profile/' , self snippet client handle , '/post/'
						, ('/' split: (aPost at: 'uri')) last).
	self snippet parent removeSnippet: self snippet
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> updateEmbeds [
	embedContainer removeChildren.

	self snippetViewModel embed
		ifNotNil: [ :anEmbed | embedContainer addChild: anEmbed asElement ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> updateHeader [

	self snippet hasParentPost
		ifTrue: [ parentInfoElement icon background: Color black ]
		ifFalse: [ parentInfoElement icon background: BrGlamorousColors disabledButtonTextColor ]
]

{ #category : #accessing }
LeBlueskySnippetEditorElement >> uploadFiles [
	self snippetViewModel hasEmbed ifTrue: [ self snippetViewModel embed upload ]
]
