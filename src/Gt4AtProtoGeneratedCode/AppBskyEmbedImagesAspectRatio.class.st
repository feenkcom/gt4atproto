Class {
	#name : #AppBskyEmbedImagesAspectRatio,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpWidth',
		'atpHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio class >> atpDescription [
 ^  'width:height represents an aspect ratio. It may be approximate, and may not correspond to absolute dimensions in any given unit.'
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio class >> atpFile [
 ^ 'app/bsky/embed/images.json'
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio class >> atpRecordName [
 ^ 'app.bsky.embed.images#aspectRatio'
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio class >> atpSchema [
 ^ '{"type":"object","description":"width:height represents an aspect ratio. It may be approximate, and may not correspond to absolute dimensions in any given unit.","required":["width","height"],"properties":{"width":{"type":"integer","minimum":1},"height":{"type":"integer","minimum":1}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesAspectRatio class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]);
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio >> atpHeight [
	<atpType:#Number format:nil>
	^ atpHeight
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio >> atpWidth [
	<atpType:#Number format:nil>
	^ atpWidth
]

{ #category : #accessing }
AppBskyEmbedImagesAspectRatio >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesAspectRatio >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesAspectRatio >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
		beRequired
]
