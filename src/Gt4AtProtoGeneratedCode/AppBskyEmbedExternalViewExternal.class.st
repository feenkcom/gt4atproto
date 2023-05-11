Class {
	#name : #AppBskyEmbedExternalViewExternal,
	#superclass : #Object,
	#instVars : [
		'atpUri',
		'atpTitle',
		'atpDescription',
		'atpThumb'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedExternalViewExternal class >> fromRequest: aRequest [
	^ self new atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpTitle: (aRequest at: 'title' ifAbsent: [ nil ]); 
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpDescription [
	^ atpDescription
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpThumb [
	^ atpThumb
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpThumb: anObject [
	atpThumb := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpTitle [
	^ atpTitle
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpTitle: anObject [
	atpTitle := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> thumbDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Thumb';
		accessor: #atpThumb
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> titleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		accessor: #atpTitle;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalViewExternal >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
