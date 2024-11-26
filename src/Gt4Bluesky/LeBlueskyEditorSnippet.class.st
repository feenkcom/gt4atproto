Class {
	#name : #LeBlueskyEditorSnippet,
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
LeBlueskyEditorSnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky editor'
]

{ #category : #accessing }
LeBlueskyEditorSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #accessing }
LeBlueskyEditorSnippet class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#parentPost -> #parentPost);
		add: (#string -> #string);
		add: (#files -> #files);
		yourself
]

{ #category : #accessing }
LeBlueskyEditorSnippet class >> leJsonV4Name [
	^ 'bskyEditorSnippet'
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> acceptVisitor: aVisitor [
	^ aVisitor visitBlueskySnippet: self
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> addFile: aFile [
	self files add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> addFiles: aCollectionOfFiles [
	aCollectionOfFiles
		do: [ :aFile | self files add: (self database addAttachmentByCopy: aFile) ].
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
LeBlueskyEditorSnippet >> addVideoFile: aFile [
	self files removeAll add: (self database addAttachmentByCopy: aFile).
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> appendText: aText source: anObject [
	self string: self string , aText asString.
	self announce: LeBlueskySnippetTextChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeBlueskySnippetEditorViewModel new snippetModel: self
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> atpParent [
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
LeBlueskyEditorSnippet >> clearFiles [
	self fileRecords removeAll.
	self files removeAll.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> client [
	^ client
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> client: anObject [
	client := anObject.
	self announce: LeBlueskySnippetClientChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> contentAsString [
	"Return a content, e.g., title or string.
	Required by ${method:LePageSummaryCardElement>>#summaryText}$"
	<return: #String>
	^ self string
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> fileRecords [
	^ fileRecords
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> fileRecords: anObject [
	fileRecords := anObject
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> fileReferences [
	^ self files collect: [ :aFile | self database localStoreRootDirectory / aFile ]
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> fileStreamsDo: aBlock [
	^ self files do: [ :aFile | self database attachmentBinaryStream: aFile do: aBlock ]
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> files [
	<return: #Array>
	^ files
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> files: anObject [
	files := anObject asOrderedCollection.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
LeBlueskyEditorSnippet >> gtViewFilesFor: aView [
	<gtView>
	self files ifEmpty: [ ^ aView empty ].

	^ aView list
		title: 'Files';
		priority: 5;
		items: [ self files ]
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> hasClient [
	^ client isNotNil
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> hasParentPost [
	^ self parentPost isNotNil
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> initialize [
	super initialize.
	string := ''.
	files := OrderedCollection new.
	fileRecords := OrderedCollection new.
	
	self initializeClient
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> initializeClient [
	client := (GtIdentityRegistry uniqueInstance firstOfType: GtBlueskyIdentity)
			ifNotNil: #createClient
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> parentFromUrl: aUrl [
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
LeBlueskyEditorSnippet >> parentPost [
	<return: #Dictionary>
	^ parentPost
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> parentPost: anObject [
	parentPost := anObject.
	self announce: LeBlueskySnippetPostChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> removeFileReference: aFileReference [
	self files
		remove: (aFileReference relativeTo: self database localStoreRootDirectory) pathString.
	self announce: LeBlueskySnippetFilesChanged new
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> string [
	^ string asString
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> string: aString [
	string := aString
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> text [
	^ string asRopedText
]

{ #category : #accessing }
LeBlueskyEditorSnippet >> updateFromCommandText: aText source: anObject [
	self string: aText asString.
	self announce: LeBlueskySnippetTextChanged new
]
