Class {
	#name : #AppBskyEmbedRecordViewBlocked,
	#superclass : #Object,
	#instVars : [
		'atProtoUri'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
