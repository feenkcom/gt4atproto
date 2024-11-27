Class {
	#name : #GtBlueskyPictureEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'files'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding class >> blueskyRecord [
	^ AppBskyEmbedImagesMain
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	| files |
	files := OrderedCollection new.
	aViewModel snippetModel clearFiles
		addFiles: (aPost atpPost atpEmbed atpImages
				collect: [ :anImage | 
					| tempFile |
					tempFile := FileLocator temp / UUID new asString.
					anImage atpFullsize asZnUrl saveContentsToFile: tempFile.
					files add: tempFile.
					tempFile ]).
	files do: #ensureDelete.
	^ GtBlueskyPictureEmbedding new
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel;
		files: aViewModel snippetModel fileReferences
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> addFile: aFile [
	self snippet addFile: aFile.
	files add: self snippet fileReferences last.
	self snippetViewModel onSnippetFilesChanged: LeBlueskySnippetFilesChanged new
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> asElement [
	| aContainer |
	aContainer := BrHorizontalPane new fitContent
			padding: (BlInsets all: 10);
			clipChildren: false.

	self files
		do: [ :aFile | 
			aContainer
				addChild: (LeBlueskyLinkFileWidget new
						vExact: 200;
						hExact: 200;
						isDeletable: self snippet hasPost not;
						file: aFile;
						onDeletion: [ :aFileForDeletion | 
							self files remove: aFileForDeletion.
							self files ifEmpty: [ self snippetViewModel embed: nil ].
							self snippet removeFileReference: aFileForDeletion ]) ].	
							
	"can not add to existing post and can only add up to 4 images"
	(self snippet hasPost not and: [ self files size < 4 ])
		ifTrue: [ aContainer
				addChild: (BrButton new beLargeSize
						aptitude: BrGlamorousButtonWithIconCircularAptitude
								+ (BrGlamorousWithDropdownAptitude
										handle: [ BrButton new beLargeSize
												aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude;
												icon: BrGlamorousVectorIcons add ]
										content: [ | selector |
											selector := BrFileSelector new
													folder: FileLocator home;
													fileFilterBlock: [ :aFileReference | aFileReference isFile and: [ GtFileUtility isImageFile: aFileReference ] ];
													okAction: [ :aFile | 
														self addFile: aFile.
														selector
															inUIProcessDo: [ selector fireEvent: BrDropdownHideWish new ] ] ]);
						icon: BrGlamorousVectorIcons add;
						label: 'Add file';
						margin: (BlInsets top: 85 left: 30)) ].

	^ BrScrollPane new fitContent
		aptitude: BrScrollPaneAptitude + BrGlamorousWithHorizontalScrollbarAptitude;
		content: aContainer
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> asJson [
	^ {'$type' -> 'app.bsky.embed.images'.
		'images'
			-> (self snippet fileRecords
					collect: [ :aRecord | 
						{'image' -> (aRecord at: 'blob').
							'alt' -> ''} asDictionary ]) asArray} asDictionary
]

{ #category : #accessing }
GtBlueskyPictureEmbedding >> files [
	^ files
]

{ #category : #accessing }
GtBlueskyPictureEmbedding >> files: anObject [
	files := anObject
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> initialize [
	super initialize.
	
	files := OrderedCollection new
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> upload [
	self files
		do: [ :aFile | 
			self snippet fileRecords
				add: (self snippet client comAtprotoRepoUploadBlobFile: aFile asFileReference) ]
]
