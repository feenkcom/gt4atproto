Class {
	#name : #LeBlueskySnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'client',
		'actor',
		'post',
		'parentPost',
		'string',
		'files',
		'fileRecords',
		'onAddedToDatabaseCallback'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky post'
]

{ #category : #accessing }
LeBlueskySnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #accessing }
LeBlueskySnippet class >> fromUrl: aUrl [
	| path handle recordId snippet did aPost |
	path := '/' split: (aUrl removePrefix: 'https://bsky.app/').
	handle := path second.
	recordId := path last.
	snippet := LeBlueskySnippet new.
	snippet client
		ifNil: [ self error: 'Not logged into Bluesky, cannot retrieve post.' ].
	did := (snippet client comAtprotoIdentityResolveHandleHandle: handle) at: 'did'.
	aPost := (snippet client
			appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/'
					, recordId
			depth: nil
			parentHeight: nil) at: 'thread'.
	snippet
		onAddedToDatabaseCallback: [ :aSnippet | 
			aPost atpPost atpEmbed
				ifNotNil: [ :anEmbed | 
					(anEmbed isKindOf: AppBskyEmbedImagesView)
						ifTrue: [ aSnippet
								addFiles: (anEmbed atpImages
										collect: [ :anImage | 
											(FileLocator imageDirectory / 'buesky_download_tempfile') ensureDelete.
											anImage atpFullsize asZnUrl
												saveContentsToFile: FileLocator imageDirectory / 'buesky_download_tempfile' ]) ] ] ].
	^ snippet
		post: {'uri' -> aPost atpPost atpUri.
				'cid' -> aPost atpPost atpCid} asDictionary;
		string: aPost atpPost atpRecord atpText
]

{ #category : #accessing }
LeBlueskySnippet class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#post -> #postDict);
		add: (#parentPost -> #parentPostDict);
		add: (#string -> #string);
		add: (#files -> #files);
		yourself
]

{ #category : #accessing }
LeBlueskySnippet class >> leJsonV4Name [
	^ 'blueskyPostSnippet'
]

{ #category : #accessing }
LeBlueskySnippet class >> stateAttributes [
	^ (self leJsonV4AttributeMapping
		reject: [ :aMapping | aMapping key = #files ]
		thenCollect: [ :aMapping | LeGenericSnippetStateAttribute named: aMapping key ])
		, {(LeGenericSnippetStateAttribute named: #onAddedToDatabaseCallback)}
]

{ #category : #accessing }
LeBlueskySnippet >> acceptVisitor: aVisitor [
	^ aVisitor visitBlueskySnippet: self
]

{ #category : #accessing }
LeBlueskySnippet >> actor [
	^ actor ifNil: [ actor := self client appBskyActorGetProfileActor: self client handle ]
]

{ #category : #accessing }
LeBlueskySnippet >> addFile: aFile [
	self files add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> addFiles: aCollectionOfFiles [
	aCollectionOfFiles
		do: [ :aFile | self files add: (self database addAttachmentByCopy: aFile) ].
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
LeBlueskySnippet >> addVideoFile: aFile [
	self files removeAll add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> appendText: aText source: anObject [
	self string: self string , aText asString.
	self announce: LeBlueskySnippetTextChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeBlueskySnippetViewModel new snippetModel: self
]

{ #category : #accessing }
LeBlueskySnippet >> atpParent [
	| response |
	self hasParentPost ifFalse: [ ^ nil ].
	response := self client
			appBskyFeedGetPostThreadUri: (self parentPost at: 'uri')
			depth: nil
			parentHeight: nil.

	(response includesKey: 'error')
		ifTrue: [ self parentPost: nil.
			^ nil ].

	^ response at: 'thread'
]

{ #category : #accessing }
LeBlueskySnippet >> atpPost [
	| response |
	(self hasPost or: [ self hasClient ]) ifFalse: [ ^ nil ].
	response := self client
			appBskyFeedGetPostThreadUri: (self post at: 'uri')
			depth: nil
			parentHeight: nil.

	(response includesKey: 'error')
		ifTrue: [ self post: nil.
			^ nil ].

	^ (response at: 'thread') client: self client
]

{ #category : #accessing }
LeBlueskySnippet >> client [
	^ client
]

{ #category : #accessing }
LeBlueskySnippet >> client: anObject [
	client := anObject.
	self announce: LeBlueskySnippetClientChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> contentAsString [
	"Return a content, e.g., title or string.
	Required by ${method:LePageSummaryCardElement>>#summaryText}$"
	<return: #String>
	^ self string
]

{ #category : #accessing }
LeBlueskySnippet >> enrichPost [
	| response |
	(self hasPost and: [ self hasClient ]) ifFalse: [ ^ nil ].
	response := self client
			appBskyFeedGetPostThreadUri: (self post at: 'uri')
			depth: nil
			parentHeight: nil.

	response := response at: 'thread'.
	post at: 'avatar' put: response author atpAvatar.
	post at: 'displayName' put: response author atpDisplayName.
	post at: 'handle' put: response author atpHandle.
	post at: 'timeStamp' put: response createdAt
]

{ #category : #accessing }
LeBlueskySnippet >> fileRecords [
	^ fileRecords
]

{ #category : #accessing }
LeBlueskySnippet >> fileRecords: anObject [
	fileRecords := anObject
]

{ #category : #accessing }
LeBlueskySnippet >> fileReferences [
	^ self files collect: [ :aFile | self database localStoreRootDirectory / aFile ]
]

{ #category : #accessing }
LeBlueskySnippet >> fileStreamsDo: aBlock [
	^ self files do: [ :aFile | self database attachmentBinaryStream: aFile do: aBlock ]
]

{ #category : #accessing }
LeBlueskySnippet >> files [
	<return: #Array>
	^ files
]

{ #category : #accessing }
LeBlueskySnippet >> files: anObject [
	files := anObject asOrderedCollection.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> hasClient [
	^ client isNotNil
]

{ #category : #accessing }
LeBlueskySnippet >> hasParentPost [
	^ self parentPost isNotNil
]

{ #category : #accessing }
LeBlueskySnippet >> hasPost [
	^ self post isNotNil
]

{ #category : #accessing }
LeBlueskySnippet >> initialize [
	super initialize.
	string := ''.
	files := OrderedCollection new.
	fileRecords := OrderedCollection new.
	
	self initializeClient
]

{ #category : #accessing }
LeBlueskySnippet >> initializeClient [
	client := (GtIdentityRegistry uniqueInstance firstOfType: GtBlueskyIdentity)
			ifNotNil: #createClient
]

{ #category : #accessing }
LeBlueskySnippet >> onAddedToDatabase [
	super onAddedToDatabase.

	self onAddedToDatabaseCallback ifNotNil: [ :aCallback | aCallback value: self ]
]

{ #category : #accessing }
LeBlueskySnippet >> onAddedToDatabaseCallback [
	^ onAddedToDatabaseCallback
]

{ #category : #accessing }
LeBlueskySnippet >> onAddedToDatabaseCallback: anObject [
	onAddedToDatabaseCallback := anObject
]

{ #category : #accessing }
LeBlueskySnippet >> parentFromUrl: aUrl [
	| path handle recordId did aPost |
	path := '/' split: (aUrl removePrefix: 'https://bsky.app/').
	handle := path second.
	recordId := path last.
	did := (self client comAtprotoIdentityResolveHandleHandle: handle) at: 'did'.
	aPost := (self client
			appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/'
					, recordId
			depth: nil
			parentHeight: nil) at: 'thread'.
	self
		parentPost: {'uri' -> aPost atpPost atpUri.
				'cid' -> aPost atpPost atpCid} asDictionary
]

{ #category : #accessing }
LeBlueskySnippet >> parentPost [
	<return: #Dictionary>
	^ parentPost
]

{ #category : #accessing }
LeBlueskySnippet >> parentPost: anObject [
	parentPost := anObject.
	self announce: LeBlueskySnippetPostChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> post [
	<return: #Dictionary>
	^ post
]

{ #category : #accessing }
LeBlueskySnippet >> post: anObject [
	post := anObject.
	post
		ifNotNil: [ post
				at: 'commit'
				ifPresent: [ :aValue | 
					post
						at: 'commit'
						put: {'cid' -> aValue atpCid.
								'rev' -> aValue atpRev} asDictionary ] ].
	self enrichPost.
	self announce: LeBlueskySnippetPostChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> removeFileReference: aFileReference [
	self files
		remove: (aFileReference relativeTo: self database localStoreRootDirectory) pathString.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> string [
	^ string asString
]

{ #category : #accessing }
LeBlueskySnippet >> string: aString [
	string := aString
]

{ #category : #accessing }
LeBlueskySnippet >> text [
	^ string asRopedText
]

{ #category : #accessing }
LeBlueskySnippet >> updateFromCommandText: aText source: anObject [
	self string: aText asString.
	self announce: LeBlueskySnippetTextChanged new
]
