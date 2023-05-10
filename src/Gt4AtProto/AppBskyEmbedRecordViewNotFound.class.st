Class {
	#name : #AppBskyEmbedRecordViewNotFound,
	#superclass : #Object,
	#instVars : [
		'atProtoUri'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewNotFound >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
