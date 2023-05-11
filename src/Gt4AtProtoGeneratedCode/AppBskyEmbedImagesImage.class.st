Class {
	#name : #AppBskyEmbedImagesImage,
	#superclass : #Object,
	#instVars : [
		'atProtoImage',
		'atProtoAlt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesImage class >> fromRequest: aRequest [
	^ self new atProtoImage: (aRequest at: 'image' ifAbsent: [ nil ]); 
		atProtoAlt: (aRequest at: 'alt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atProtoAlt;
	beRequired
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atProtoAlt [
	^ atProtoAlt
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atProtoAlt: anObject [
	atProtoAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atProtoImage [
	^ atProtoImage
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atProtoImage: anObject [
	atProtoImage := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> imageDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Image';
		accessor: #atProtoImage;
	beRequired
]
