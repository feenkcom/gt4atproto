Class {
	#name : #AppBskyEmbedVideoView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCid',
		'atpPlaylist',
		'atpThumbnail',
		'atpAlt',
		'atpAspectRatio'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedVideoView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedVideoView class >> atpFile [
 ^ 'app/bsky/embed/video.json'
]

{ #category : #accessing }
AppBskyEmbedVideoView class >> atpRecordName [
 ^ 'app.bsky.embed.video#view'
]

{ #category : #accessing }
AppBskyEmbedVideoView class >> atpSchema [
 ^ '{"type":"object","required":["cid","playlist"],"properties":{"cid":{"type":"string","format":"cid"},"playlist":{"type":"string","format":"uri"},"thumbnail":{"type":"string","format":"uri"},"alt":{"type":"string","maxGraphemes":1000,"maxLength":10000},"aspectRatio":{"type":"ref","ref":"app.bsky.embed.defs#aspectRatio"}}}'
]

{ #category : #serialization }
AppBskyEmbedVideoView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpPlaylist: (aRequest at: 'playlist' ifAbsent: [ nil ]);
		atpThumbnail: (aRequest at: 'thumbnail' ifAbsent: [ nil ]);
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ]);
		atpAspectRatio: (aRequest
				at: 'aspectRatio'
				ifPresent: [ :aValue | AppBskyEmbedDefsAspectRatio fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedVideoView >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt
]

{ #category : #'as yet unclassified' }
AppBskyEmbedVideoView >> asEmbeddedElement [
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

{ #category : #magritte }
AppBskyEmbedVideoView >> aspectRatioDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'AspectRatio';
		accessor: #atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpAlt [
	<atpType:#String format:nil>
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpAspectRatio [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	<atpType:#AppBskyEmbedDefsAspectRatio format:nil>
	^ atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpAspectRatio: anObject [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	atpAspectRatio := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpPlaylist [
	<atpType:#String format:'uri'>
	^ atpPlaylist
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpPlaylist: anObject [
	atpPlaylist := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpThumbnail [
	<atpType:#String format:'uri'>
	^ atpThumbnail
]

{ #category : #accessing }
AppBskyEmbedVideoView >> atpThumbnail: anObject [
	atpThumbnail := anObject
]

{ #category : #magritte }
AppBskyEmbedVideoView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedVideoView >> playlistDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Playlist';
		accessor: #atpPlaylist;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedVideoView >> thumbnailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumbnail';
		accessor: #atpThumbnail
]
