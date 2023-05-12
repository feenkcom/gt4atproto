Class {
	#name : #AppBskyEmbedImagesMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpImages: (aRequest at: 'images' ifAbsent: [ nil ])
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
