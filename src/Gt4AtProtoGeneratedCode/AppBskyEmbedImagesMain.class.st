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
AppBskyEmbedImagesMain class >> atpRecordName [
 ^ 'app.bsky.embed.images'
]

{ #category : #serialization }
AppBskyEmbedImagesMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpImages: (aRequest at: 'images' ifPresent: [:anArray | anArray collect: [:aValue |AppBskyEmbedImagesImage fromRequest: aValue ] ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesMain >> atpImages [
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
