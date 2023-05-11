Class {
	#name : #AppBskyEmbedImagesImage,
	#superclass : #Object,
	#instVars : [
		'atpImage',
		'atpAlt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesImage class >> fromRequest: aRequest [
	^ self new atpImage: (aRequest at: 'image' ifAbsent: [ nil ]); 
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt;
	beRequired
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAlt [
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpImage [
	^ atpImage
]

{ #category : #accessing }
AppBskyEmbedImagesImage >> atpImage: anObject [
	atpImage := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesImage >> imageDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Image';
		accessor: #atpImage;
	beRequired
]
