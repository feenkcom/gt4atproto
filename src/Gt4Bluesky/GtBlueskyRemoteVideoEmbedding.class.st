Class {
	#name : #GtBlueskyRemoteVideoEmbedding,
	#superclass : #GtBlueskyVideoEmbedding,
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding class >> blueskyRecord [
	^ AppBskyEmbedVideoMain
]

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	^ GtBlueskyRemoteVideoEmbedding new
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel;
		file: aPost atpPost atpEmbed atpPlaylist
]

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding >> asJson [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding >> file: anObject [
	file := anObject
]

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding >> fileElement [
	^ GtProtoWebViewElement new
		constraintsDo: [ :c | 
			c vertical exact: 180.
			c horizontal exact: 180 ];
		html: '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <video id="myVideo" src="' , self file
				, '" style="max-width: 90%; max-height: 90%;" controls></video>
    </div>
</body>
</html>
'
]

{ #category : #'as yet unclassified' }
GtBlueskyRemoteVideoEmbedding >> upload [
]
