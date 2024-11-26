Class {
	#name : #AppBskyEmbedImagesViewImage,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedImagesViewImage',
	#classTraits : 'TAppBskyEmbedImagesViewImage classTrait',
	#instVars : [
		'atpThumb',
		'atpFullsize',
		'atpAlt',
		'atpAspectRatio'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesViewImage class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage class >> atpFile [
 ^ 'app/bsky/embed/images.json'
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage class >> atpRecordName [
 ^ 'app.bsky.embed.images#viewImage'
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage class >> atpSchema [
 ^ '{"type":"object","required":["thumb","fullsize","alt"],"properties":{"thumb":{"type":"string","format":"uri","description":"Fully-qualified URL where a thumbnail of the image can be fetched. For example, CDN location provided by the App View."},"fullsize":{"type":"string","format":"uri","description":"Fully-qualified URL where a large version of the image can be fetched. May or may not be the exact original blob. For example, CDN location provided by the App View."},"alt":{"type":"string","description":"Alt text description of the image, for accessibility."},"aspectRatio":{"type":"ref","ref":"app.bsky.embed.defs#aspectRatio"}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesViewImage class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ]);
		atpFullsize: (aRequest at: 'fullsize' ifAbsent: [ nil ]);
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ]);
		atpAspectRatio: (aRequest
				at: 'aspectRatio'
				ifPresent: [ :aValue | AppBskyEmbedDefsAspectRatio fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> aspectRatioDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'AspectRatio';
		accessor: #atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt [
	<atpType:#String format:nil>
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAspectRatio [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	<atpType:#AppBskyEmbedDefsAspectRatio format:nil>
	^ atpAspectRatio
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAspectRatio: anObject [
	<referenceTo:'app.bsky.embed.defs#aspectRatio'>
	atpAspectRatio := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize [
	<atpType:#String format:'uri'>
	^ atpFullsize
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize: anObject [
	atpFullsize := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpThumb [
	<atpType:#String format:'uri'>
	^ atpThumb
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpThumb: anObject [
	atpThumb := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> fullsizeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Fullsize';
		accessor: #atpFullsize;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> thumbDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumb';
		accessor: #atpThumb;
		beRequired
]
