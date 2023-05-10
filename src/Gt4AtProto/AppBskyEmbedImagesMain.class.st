Class {
	#name : #AppBskyEmbedImagesMain,
	#superclass : #Object,
	#instVars : [
		'atProtoImages'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
		classes: {Image};
		label: 'Images';
		accessor: #atProtoImages;
	beRequired
]
