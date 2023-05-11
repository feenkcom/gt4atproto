Class {
	#name : #AppBskyEmbedImagesViewImage,
	#superclass : #Object,
	#instVars : [
		'atProtoThumb',
		'atProtoFullsize',
		'atProtoAlt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesViewImage class >> fromRequest: aRequest [
	^ self new atProtoThumb: (aRequest at: 'thumb' ifAbsent: [ nil ]); 
		atProtoFullsize: (aRequest at: 'fullsize' ifAbsent: [ nil ]); 
		atProtoAlt: (aRequest at: 'alt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atProtoAlt;
	beRequired
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoAlt [
	^ atProtoAlt
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoAlt: anObject [
	atProtoAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoFullsize [
	^ atProtoFullsize
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoFullsize: anObject [
	atProtoFullsize := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoThumb [
	^ atProtoThumb
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atProtoThumb: anObject [
	atProtoThumb := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> fullsizeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Fullsize';
		accessor: #atProtoFullsize;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> thumbDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumb';
		accessor: #atProtoThumb;
	beRequired
]
