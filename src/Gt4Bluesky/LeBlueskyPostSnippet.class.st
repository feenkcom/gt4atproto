Class {
	#name : #LeBlueskyPostSnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'client',
		'parentPost',
		'string',
		'files',
		'fileRecords'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskyPostSnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky post'
]

{ #category : #accessing }
LeBlueskyPostSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #accessing }
LeBlueskyPostSnippet class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#parentPost -> #parentPost);
		add: (#string -> #string);
		add: (#files -> #files);
		yourself
]

{ #category : #accessing }
LeBlueskyPostSnippet class >> leJsonV4Name [
	^ 'bskyEditorSnippet'
]

{ #category : #accessing }
LeBlueskyPostSnippet >> acceptVisitor: aVisitor [
	^ aVisitor visitBlueskySnippet: self
]

{ #category : #accessing }
LeBlueskyPostSnippet >> addFile: aFile [
	self files add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> addFiles: aCollectionOfFiles [
	aCollectionOfFiles
		do: [ :aFile | self files add: (self database addAttachmentByCopy: aFile) ].
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> addVideoFile: aFile [
	self files removeAll add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> appendText: aText source: anObject [
	self string: self string , aText asString.
	self announce: LeBlueskySnippetTextChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeBlueskyPostSnippetViewModel new snippetModel: self
]

{ #category : #accessing }
LeBlueskyPostSnippet >> atpParent [
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

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> clearFiles [
	self fileRecords removeAll.
	self files removeAll.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> client [
	^ client
]

{ #category : #accessing }
LeBlueskyPostSnippet >> client: anObject [
	client := anObject.
	self announce: LeBlueskySnippetClientChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> contentAsString [
	"Return a content, e.g., title or string.
	Required by ${method:LePageSummaryCardElement>>#summaryText}$"
	<return: #String>
	^ self string
]

{ #category : #accessing }
LeBlueskyPostSnippet >> fileRecords [
	^ fileRecords
]

{ #category : #accessing }
LeBlueskyPostSnippet >> fileRecords: anObject [
	fileRecords := anObject
]

{ #category : #accessing }
LeBlueskyPostSnippet >> fileReferences [
	^ self files collect: [ :aFile | self database localStoreRootDirectory / aFile ]
]

{ #category : #accessing }
LeBlueskyPostSnippet >> fileStreamsDo: aBlock [
	^ self files do: [ :aFile | self database attachmentBinaryStream: aFile do: aBlock ]
]

{ #category : #accessing }
LeBlueskyPostSnippet >> files [
	<return: #Array>
	^ files
]

{ #category : #accessing }
LeBlueskyPostSnippet >> files: anObject [
	files := anObject asOrderedCollection.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> gtViewFilesFor: aView [
	<gtView>
	self files ifEmpty: [ ^ aView empty ].

	^ aView list
		title: 'Files';
		priority: 5;
		items: [ self files ]
]

{ #category : #accessing }
LeBlueskyPostSnippet >> hasClient [
	^ client isNotNil
]

{ #category : #accessing }
LeBlueskyPostSnippet >> hasParentPost [
	^ self parentPost isNotNil
]

{ #category : #accessing }
LeBlueskyPostSnippet >> initialize [
	super initialize.
	string := ''.
	files := OrderedCollection new.
	fileRecords := OrderedCollection new.
	
	self initializeClient
]

{ #category : #accessing }
LeBlueskyPostSnippet >> initializeClient [
	client := (GtIdentityRegistry uniqueInstance firstOfType: GtBlueskyIdentity)
			ifNotNil: #createClient
]

{ #category : #accessing }
LeBlueskyPostSnippet >> parentFromUrl: aUrl [
	| path handle recordId did aPost |
	aUrl isEmptyOrNil
		ifTrue: [ self parentPost: nil.
			^ self ].
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
LeBlueskyPostSnippet >> parentPost [
	<return: #Dictionary>
	^ parentPost
]

{ #category : #accessing }
LeBlueskyPostSnippet >> parentPost: anObject [
	parentPost := anObject.
	self announce: LeBlueskySnippetPostChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> removeFileReference: aFileReference [
	self files
		remove: (aFileReference relativeTo: self database localStoreRootDirectory) pathString.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippet >> string [
	^ string asString
]

{ #category : #accessing }
LeBlueskyPostSnippet >> string: aString [
	string := aString
]

{ #category : #accessing }
LeBlueskyPostSnippet >> text [
	^ string asRopedText
]

{ #category : #accessing }
LeBlueskyPostSnippet >> updateFromCommandText: aText source: anObject [
	self string: aText asString.
	self announce: LeBlueskySnippetTextChanged new
]
