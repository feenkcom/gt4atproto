Class {
	#name : #GtApCreatePostForm,
	#superclass : #BrVerticalPane,
	#instVars : [
		'editorElement',
		'acceptButton',
		'client',
		'actor',
		'files',
		'fileRecords',
		'addFileButton',
		'post'
	],
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #accessing }
GtApCreatePostForm >> actor [
	^ actor
]

{ #category : #accessing }
GtApCreatePostForm >> actor: anObject [
	actor := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> client [
	^ client
]

{ #category : #accessing }
GtApCreatePostForm >> client: anObject [
	client := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> createAcceptButton [
	^ acceptButton := BrButton new
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons accept;
			label: 'Publish';
			action: [ | record |
				self uploadFiles.
				record := {'$type' -> AppBskyFeedPostMain atpRecordName.
						'createdAt' -> DateAndTime now printString.
						'text' -> editorElement text asString} asDictionary.
				self fileRecords ifNotEmpty: [ record at: 'embed' put: self filesToEmbed ].

				self hasPost
					ifTrue: [ | root |
						root := self post getRoot.
						record
							at: 'reply'
							put: {'parent'
										-> {'uri' -> self post atpPost atpUri.
												'cid' -> self post atpPost atpCid} asDictionary.
									'root'
										-> {'uri' -> root atpPost atpUri.
												'cid' -> root atpPost atpCid} asDictionary} asDictionary ].

				self phlow
					spawnObject: (self client
							comAtprotoRepoCreateRecordrepo: self actor atpDid
							collection: AppBskyFeedPostMain atpRecordName
							rkey: nil
							validate: nil
							record: record
							swapCommit: nil) ]
]

{ #category : #accessing }
GtApCreatePostForm >> createAddFileButton [
	^ addFileButton := BrButton new
			beSmallSize;
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
											inUIProcessDo: [ addFileButton dispatchEvent: BrDropdownHideWish new ] ] ]);
			icon: BrGlamorousVectorIcons add;
			label: 'Add File'
]

{ #category : #accessing }
GtApCreatePostForm >> createButtonToolbar [
	^ BrToolbar new
		aptitude: BrGlamorousToolbarAptitude new;
		addItem: self createAddFileButton;
		addItem: self createAcceptButton
]

{ #category : #accessing }
GtApCreatePostForm >> createEditor [
	^ editorElement := BrEditor new matchParent aptitude: BrGlamorousRegularEditorAptitude
]

{ #category : #accessing }
GtApCreatePostForm >> fileRecords [
	^ fileRecords
]

{ #category : #accessing }
GtApCreatePostForm >> fileRecords: anObject [
	fileRecords := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> files [
	^ files
]

{ #category : #accessing }
GtApCreatePostForm >> files: anObject [
	files := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> filesToEmbed [
	^ {'$type' -> 'app.bsky.embed.images'.
		'images'
			-> (self fileRecords
					collect: [ :aRecord | 
						{'image' -> (aRecord at: 'blob').
							'alt' -> ''} asDictionary ]) asArray} asDictionary
]

{ #category : #accessing }
GtApCreatePostForm >> hasPost [
	^ self post isNotNil
]

{ #category : #accessing }
GtApCreatePostForm >> initialize [
	super initialize.
	
	files := OrderedCollection new.
	fileRecords := OrderedCollection new.

	self hMatchParent.
	self vFitContentLimited.
	self padding: (BlInsets all: 8).

	self addChild: self createEditor.
	self addChild: self createButtonToolbar
]

{ #category : #accessing }
GtApCreatePostForm >> post [
	^ post
]

{ #category : #accessing }
GtApCreatePostForm >> post: anObject [
	post := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> uploadFiles [
	self files do: [ :aFile | self fileRecords add: (self client comAtprotoRepoUploadBlobFile: aFile) ]
]
