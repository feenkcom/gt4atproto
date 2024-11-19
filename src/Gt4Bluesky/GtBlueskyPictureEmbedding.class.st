Class {
	#name : #GtBlueskyPictureEmbedding,
	#superclass : #GtBlueskyFileEmbedding,
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding class >> blueskyRecord [
	^ AppBskyEmbedImagesMain
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	aViewModel snippetModel
		addFiles: (aPost atpPost atpEmbed atpImages
				collect: [ :anImage | 
					(FileLocator imageDirectory / 'buesky_download_tempfile') ensureDelete.
					anImage atpFullsize asZnUrl
						saveContentsToFile: FileLocator imageDirectory / 'buesky_download_tempfile' ]).
	^ GtBlueskyPictureEmbedding new
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel;
		file: FileLocator imageDirectory / 'buesky_download_tempfile'
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

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> fileElement [
	| aContainer |
	aContainer := BrHorizontalPane new vFitContent hMatchParent
			padding: (BlInsets all: 5);
			clipChildren: false;
			addChild: (LeBlueskyPostFileWidget new
					vExact: 200;
					hExact: 200;
					isDeletable: self snippet hasPost not;
					file: self file;
					onDeletion: [ :aFileForDeletion | 
						self snippet clearFiles.
						self snippetViewModel embed: nil ]).

	self snippet hasPost
		ifFalse: [ aContainer
				addChild: (BrButton new beLargeSize
						aptitude: BrGlamorousButtonWithIconCircularAptitude;
						icon: BrGlamorousVectorIcons add;
						label: 'Add file';
						action: [  ];
						margin: (BlInsets top: 85 left: 30)) ].

	^ aContainer
]

{ #category : #'as yet unclassified' }
GtBlueskyPictureEmbedding >> upload [
	self snippet fileRecords
		add: (self snippet client comAtprotoRepoUploadBlobFile: self file)
]
