Class {
	#name : #AppBskyEmbedImagesView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesView class >> atpRecordName [
 ^ 'app.bsky.embed.images#view'
]

{ #category : #serialization }
AppBskyEmbedImagesView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpImages: (aRequest at: 'images' ifPresent: [:anArray | anArray collect: [:aValue |AppBskyEmbedImagesViewImage fromRequest: aValue ] ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atpImages [
	^ atpImages
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atpImages: anObject [
	atpImages := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesView >> imagesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesViewImage};
		label: 'Images';
		accessor: #atpImages;
	beRequired
]
