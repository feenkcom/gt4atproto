Class {
	#name : #AppBskyEmbedImagesViewImage,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedImagesViewImage',
	#classTraits : 'TAppBskyEmbedImagesViewImage classTrait',
	#instVars : [
		'atpThumb',
		'atpFullsize',
		'atpAlt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesViewImage class >> atpDescription [
 ^ ''
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
 ^ '{"type":"object","required":["thumb","fullsize","alt"],"properties":{"thumb":{"type":"string"},"fullsize":{"type":"string"},"alt":{"type":"string"}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesViewImage class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ]); 
		atpFullsize: (aRequest at: 'fullsize' ifAbsent: [ nil ]); 
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt;
	beRequired
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt [
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize [
	^ atpFullsize
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize: anObject [
	atpFullsize := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpThumb [
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
