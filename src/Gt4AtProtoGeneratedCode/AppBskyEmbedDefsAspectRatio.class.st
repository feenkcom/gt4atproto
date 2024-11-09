Class {
	#name : #AppBskyEmbedDefsAspectRatio,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpWidth',
		'atpHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio class >> atpDescription [
 ^  'width:height represents an aspect ratio. It may be approximate, and may not correspond to absolute dimensions in any given unit.'
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio class >> atpFile [
 ^ 'app/bsky/embed/defs.json'
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio class >> atpRecordName [
 ^ 'app.bsky.embed.defs#aspectRatio'
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio class >> atpSchema [
 ^ '{"type":"object","description":"width:height represents an aspect ratio. It may be approximate, and may not correspond to absolute dimensions in any given unit.","required":["width","height"],"properties":{"width":{"type":"integer","minimum":1},"height":{"type":"integer","minimum":1}}}'
]

{ #category : #serialization }
AppBskyEmbedDefsAspectRatio class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]);
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio >> atpHeight [
	<atpType:#Number format:nil>
	^ atpHeight
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio >> atpWidth [
	<atpType:#Number format:nil>
	^ atpWidth
]

{ #category : #accessing }
AppBskyEmbedDefsAspectRatio >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
AppBskyEmbedDefsAspectRatio >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedDefsAspectRatio >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
		beRequired
]
