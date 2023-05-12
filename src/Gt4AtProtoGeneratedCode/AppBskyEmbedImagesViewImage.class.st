Class {
	#name : #AppBskyEmbedImagesViewImage,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpThumb',
		'atpFullsize',
		'atpAlt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedImagesViewImage class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ]); 
		atpFullsize: (aRequest at: 'fullsize' ifAbsent: [ nil ]); 
		atpAlt: (aRequest at: 'alt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> altDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Alt';
		accessor: #atpAlt;
	beRequired
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt [
	^ atpAlt
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpAlt: anObject [
	atpAlt := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize [
	^ atpFullsize
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpFullsize: anObject [
	atpFullsize := anObject
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpThumb [
	^ atpThumb
]

{ #category : #accessing }
AppBskyEmbedImagesViewImage >> atpThumb: anObject [
	atpThumb := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> fullsizeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Fullsize';
		accessor: #atpFullsize;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedImagesViewImage >> thumbDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumb';
		accessor: #atpThumb;
	beRequired
]
