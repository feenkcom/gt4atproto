Class {
	#name : #AppBskyEmbedVideoMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpVideo',
		'atpCaptions',
		'atpAlt',
		'atpAspectRatio'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedVideoMain class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedVideoMain class >> atpFile [
 ^ 'app/bsky/embed/video.json'
]

{ #category : #accessing }
AppBskyEmbedVideoMain class >> atpRecordName [
 ^ 'app.bsky.embed.video'
]

{ #category : #accessing }
AppBskyEmbedVideoMain class >> atpSchema [
 ^ '{"type":"object","required":["video"],"properties":{"video":{"type":"blob","accept":["video/mp4"],"maxSize":50000000},"captions":{"type":"array","items":{"type":"ref","ref":"#caption"},"maxLength":20},"alt":{"type":"string","description":"Alt text description of the video, for accessibility.","maxGraphemes":1000,"maxLength":10000},"aspectRatio":{"type":"ref","ref":"app.bsky.embed.defs#aspectRatio"}}}'
]

{ #category : #serialization }
AppBskyEmbedVideoMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpVideo: (aRequest at: 'video' ifAbsent: [ nil ]);
		atpCaptions: (aRequest
				at: 'captions'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyEmbedVideoCaption fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ]);
		atpAspectRatio: (aRequest
				at: 'aspectRatio'
				ifPresent: [ :aValue | AppBskyEmbedDefsAspectRatio fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedVideoMain >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt
]

{ #category : #magritte }
AppBskyEmbedVideoMain >> aspectRatioDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'AspectRatio';
		accessor: #atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpAlt [
	<atpType:#String format:nil>
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpAspectRatio [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	<atpType:#AppBskyEmbedDefsAspectRatio format:nil>
	^ atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpAspectRatio: anObject [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	atpAspectRatio := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpCaptions [
	<atpType:#AppBskyEmbedVideoCaption format:nil>
	<atpCollection>
	^ atpCaptions
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpCaptions: anObject [
	atpCaptions := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpVideo [
	<atpType:#ByteArray format:nil>
	^ atpVideo
]

{ #category : #accessing }
AppBskyEmbedVideoMain >> atpVideo: anObject [
	atpVideo := anObject
]

{ #category : #magritte }
AppBskyEmbedVideoMain >> captionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedVideoCaption};
		label: 'Captions';
		accessor: #atpCaptions
]

{ #category : #magritte }
AppBskyEmbedVideoMain >> videoDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Video';
		accessor: #atpVideo;
		beRequired
]
