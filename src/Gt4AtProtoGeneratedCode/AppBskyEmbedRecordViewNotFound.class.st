Class {
	#name : #AppBskyEmbedRecordViewNotFound,
	#superclass : #Object,
	#instVars : [
		'atProtoUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordViewNotFound class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

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
