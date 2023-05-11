Class {
	#name : #AppBskyEmbedImagesView,
	#superclass : #Object,
	#instVars : [
		'atpImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesView class >> fromRequest: aRequest [
	^ self new atpImages: (aRequest at: 'images' ifAbsent: [ nil ])
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
