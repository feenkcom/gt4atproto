Class {
	#name : #AppBskyEmbedRecordViewBlocked,
	#superclass : #Object,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordViewBlocked class >> fromRequest: aRequest [
	^ self new atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
