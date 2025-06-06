Class {
	#name : #AppBskyEmbedExternalViewExternal,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpTitle',
		'atpDescription',
		'atpThumb'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedExternalViewExternal class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal class >> atpFile [
 ^ 'app/bsky/embed/external.json'
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal class >> atpRecordName [
 ^ 'app.bsky.embed.external#viewExternal'
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal class >> atpSchema [
 ^ '{"type":"object","required":["uri","title","description"],"properties":{"uri":{"type":"string","format":"uri"},"title":{"type":"string"},"description":{"type":"string"},"thumb":{"type":"string","format":"uri"}}}'
]

{ #category : #serialization }
AppBskyEmbedExternalViewExternal class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpTitle: (aRequest at: 'title' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpThumb [
	<atpType:#String format:'uri'>
	^ atpThumb
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpThumb: anObject [
	atpThumb := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpTitle [
	<atpType:#String format:nil>
	^ atpTitle
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpTitle: anObject [
	atpTitle := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalViewExternal >> atpUri [
	<atpType:#String format:'uri'>
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
