Class {
	#name : #GtBlueskyVideoEmbedding,
	#superclass : #GtBlueskyFileEmbedding,
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyVideoEmbedding >> asJson [
	^ {'$type' -> 'app.bsky.embed.video'.
		'video' -> (self snippet fileRecords first at: 'blob')} asDictionary
]

{ #category : #'as yet unclassified' }
GtBlueskyVideoEmbedding >> fileElement [
	^ GtProtoWebViewVideoFileElement new
		constraintsDo: [ :c | 
			c vertical exact: 200.
			c horizontal exact: 200 ];
		file: self file;
		clipChildren: false;
		addChild: (BrButton new beTinySize
				aptitude: BrGlamorousButtonWithIconCircularAptitude;
				icon: BrGlamorousVectorIcons cancel;
				label: 'Remove file';
				action: [ self snippet clearFiles.
					self snippetViewModel embed: nil ];
				constraintsDo: [ :c | 
					c ignoreByLayout.
					c ignored horizontal alignRight.
					c ignored vertical alignTop ];
				margin: (BlInsets top: -16 right: -16));
		margin: (BlInsets all: 20)
]

{ #category : #'as yet unclassified' }
GtBlueskyVideoEmbedding >> upload [
	self snippet fileRecords
		add: (self snippet client comAtprotoRepoUploadBlobFile: self file)
	"self snippet fileRecords
		add: (self snippet client
				procedureOn: 'app.bsky.video.uploadVideo'
				withFile: self file)"
]
