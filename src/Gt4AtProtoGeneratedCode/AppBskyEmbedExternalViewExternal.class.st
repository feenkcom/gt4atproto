Class {
	#name : #AppBskyEmbedExternalViewExternal,
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
AppBskyEmbedExternalViewExternal class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoTitle: (aRequest at: 'title' ifAbsent: [ nil ]); 
		atProtoDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atProtoThumb: (aRequest at: 'thumb' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoDescription [
	^ atProtoDescription
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoDescription: anObject [
	atProtoDescription := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoThumb [
	^ atProtoThumb
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoThumb: anObject [
	atProtoThumb := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoTitle [
	^ atProtoTitle
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoTitle: anObject [
	atProtoTitle := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atProtoDescription;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> thumbDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumb';
		accessor: #atProtoThumb
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> titleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		accessor: #atProtoTitle;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
