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
		'fileRecords'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky'
]

{ #category : #accessing }
LeBlueskySnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
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
			depth: nil.

	(response includesKey: 'error')
		ifTrue: [ self parentPost: nil.
			^ nil ].

	^ response at: 'thread'
]

{ #category : #accessing }
LeBlueskySnippet >> atpPost [
	| response |
	self hasPost ifFalse: [ ^ nil ].
	response := self client
			appBskyFeedGetPostThreadUri: (self post at: 'uri')
			depth: nil.

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
			depth: nil.

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
LeBlueskySnippet >> files [
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
	client := LeBlueskyIdentityStore uniqueInstance getFirstOrNil
]

{ #category : #accessing }
LeBlueskySnippet >> parentPost [
	^ parentPost
]

{ #category : #accessing }
LeBlueskySnippet >> parentPost: anObject [
	parentPost := anObject.
	self announce: LeBlueskySnippetPostChanged new
]

{ #category : #accessing }
LeBlueskySnippet >> post [
	^ post
]

{ #category : #accessing }
LeBlueskySnippet >> post: anObject [
	post := anObject.
	self enrichPost.
	self announce: LeBlueskySnippetPostChanged new
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
