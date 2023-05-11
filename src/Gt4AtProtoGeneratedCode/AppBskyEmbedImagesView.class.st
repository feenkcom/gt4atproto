Class {
	#name : #AppBskyEmbedImagesView,
	#superclass : #Object,
	#instVars : [
		'atProtoImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesView class >> fromRequest: aRequest [
	^ self new atProtoImages: (aRequest at: 'images' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atProtoImages [
	^ atProtoImages
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atProtoImages: anObject [
	atProtoImages := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesView >> imagesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesViewImage};
		label: 'Images';
		accessor: #atProtoImages;
	beRequired
]
