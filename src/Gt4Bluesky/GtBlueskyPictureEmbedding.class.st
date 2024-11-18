Class {
	#name : #GtBlueskyPictureEmbedding,
	#superclass : #GtBlueskyFileEmbedding,
	#category : #'Gt4Bluesky-Models'
}

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
	^ LeBlueskyPostFileWidget new
		vExact: 200;
		hExact: 200;
		isDeletable: self snippet hasPost not;
		file: self file;
		onDeletion: [ :aFileForDeletion | self snippet removeFileReference: aFileForDeletion ]
]
