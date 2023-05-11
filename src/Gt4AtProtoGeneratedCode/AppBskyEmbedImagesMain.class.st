Class {
	#name : #AppBskyEmbedImagesMain,
	#superclass : #Object,
	#instVars : [
		'atProtoImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesMain class >> fromRequest: aRequest [
	^ self new atProtoImages: (aRequest at: 'images' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesMain >> atProtoImages [
	^ atProtoImages
]

{ #category : #accessing }
AppBskyEmbedImagesMain >> atProtoImages: anObject [
	atProtoImages := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesMain >> imagesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesImage};
		label: 'Images';
		accessor: #atProtoImages;
	beRequired
]
