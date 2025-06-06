Trait {
	#name : #TAppBskyEmbedVideoView,
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #'as yet unclassified' }
TAppBskyEmbedVideoView >> asElement [
	^ GtProtoWebViewElement new
		html: '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <video id="myVideo" src="'
				, self atpPlaylist
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

{ #category : #'as yet unclassified' }
TAppBskyEmbedVideoView >> asEmbeddedElement [
	^ GtProtoWebViewElement new
		constraintsDo: [ :c | c vertical exact: 200 ];
		html: '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <video id="myVideo" src="'
				, self atpPlaylist
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

{ #category : #'as yet unclassified' }
TAppBskyEmbedVideoView >> gtWebpageFor: aView [
	<gtView>
	^ aView explicit
		title: 'Webpage';
		priority: 1;
		stencil: [ self asElement
				margin: (BlInsets all: 10);
				background: Color white;
				aptitude: BrShadowAptitude ]
]
