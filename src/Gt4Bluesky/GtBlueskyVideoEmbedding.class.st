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
	^ GtProtoWebViewElement new
		constraintsDo: [ :c | 
			c vertical exact: 200.
			c horizontal exact: 200 ];
		html: '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <video id="myVideo" src="file://' , self file pathString
				, '" style="max-width: 90%; max-height: 90%;" controls></video>
    </div>

    <script>
        document.addEventListener(''DOMContentLoaded'', function() {
            var video = document.getElementById(''myVideo'');
            video.currentTime = 355; // Start from 10 seconds
        });
    </script>
</body>
</html>
'
]
