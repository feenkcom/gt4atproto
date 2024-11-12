Class {
	#name : #AppBskyEmbedImagesImage,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpImage',
		'atpAlt',
		'atpAspectRatio'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesImage class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedImagesImage class >> atpFile [
 ^ 'app/bsky/embed/images.json'
]

{ #category : #accessing }
AppBskyEmbedImagesImage class >> atpRecordName [
 ^ 'app.bsky.embed.images#image'
]

{ #category : #accessing }
AppBskyEmbedImagesImage class >> atpSchema [
 ^ '{"type":"object","required":["image","alt"],"properties":{"image":{"type":"blob","accept":["image/*"],"maxSize":1000000},"alt":{"type":"string","description":"Alt text description of the image, for accessibility."},"aspectRatio":{"type":"ref","ref":"app.bsky.embed.defs#aspectRatio"}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesImage class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpImage: (aRequest at: 'image' ifAbsent: [ nil ]);
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ]);
		atpAspectRatio: (aRequest
				at: 'aspectRatio'
				ifPresent: [ :aValue | AppBskyEmbedDefsAspectRatio fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> aspectRatioDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'AspectRatio';
		accessor: #atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAlt [
	<atpType:#String format:nil>
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAspectRatio [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	<atpType:#AppBskyEmbedDefsAspectRatio format:nil>
	^ atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAspectRatio: anObject [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	atpAspectRatio := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpImage [
	<atpType:#ByteArray format:nil>
	^ atpImage
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpImage: anObject [
	atpImage := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> imageDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Image';
		accessor: #atpImage;
		beRequired
]
