Class {
	#name : #AppBskyEmbedImagesMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesMain class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedImagesMain class >> atpFile [
 ^ 'app/bsky/embed/images.json'
]

{ #category : #accessing }
AppBskyEmbedImagesMain class >> atpRecordName [
 ^ 'app.bsky.embed.images'
]

{ #category : #accessing }
AppBskyEmbedImagesMain class >> atpSchema [
 ^ '{"type":"object","required":["images"],"properties":{"images":{"type":"array","items":{"type":"ref","ref":"#image"},"maxLength":4}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpImages: (aRequest
				at: 'images'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyEmbedImagesImage fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesMain >> atpImages [
	<atpType:#AppBskyEmbedImagesImage format:nil>
	<atpCollection>
	^ atpImages
]

{ #category : #accessing }
AppBskyEmbedImagesMain >> atpImages: anObject [
	atpImages := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesMain >> imagesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesImage};
		label: 'Images';
		accessor: #atpImages;
		beRequired
]
