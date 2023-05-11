Class {
	#name : #AppBskyEmbedExternalExternal,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoTitle',
		'atProtoDescription',
		'atProtoThumb'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedExternalExternal class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoTitle: (aRequest at: 'title' ifAbsent: [ nil ]); 
		atProtoDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atProtoThumb: (aRequest at: 'thumb' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoDescription [
	^ atProtoDescription
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoDescription: anObject [
	atProtoDescription := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoThumb [
	^ atProtoThumb
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoThumb: anObject [
	atProtoThumb := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoTitle [
	^ atProtoTitle
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoTitle: anObject [
	atProtoTitle := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atProtoDescription;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> thumbDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Thumb';
		accessor: #atProtoThumb
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> titleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		accessor: #atProtoTitle;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
