Class {
	#name : #AppBskyEmbedImagesView,
	#superclass : #Object,
	#instVars : [
		'atProtoImages'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
		classes: {ViewImage};
		label: 'Images';
		accessor: #atProtoImages;
	beRequired
]
