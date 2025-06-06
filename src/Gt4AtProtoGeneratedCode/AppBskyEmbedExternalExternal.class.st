Class {
	#name : #AppBskyEmbedExternalExternal,
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
AppBskyEmbedExternalExternal class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedExternalExternal class >> atpFile [
 ^ 'app/bsky/embed/external.json'
]

{ #category : #accessing }
AppBskyEmbedExternalExternal class >> atpRecordName [
 ^ 'app.bsky.embed.external#external'
]

{ #category : #accessing }
AppBskyEmbedExternalExternal class >> atpSchema [
 ^ '{"type":"object","required":["uri","title","description"],"properties":{"uri":{"type":"string","format":"uri"},"title":{"type":"string"},"description":{"type":"string"},"thumb":{"type":"blob","accept":["image/*"],"maxSize":1000000}}}'
]

{ #category : #serialization }
AppBskyEmbedExternalExternal class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpTitle: (aRequest at: 'title' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpThumb: (aRequest at: 'thumb' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpThumb [
	<atpType:#ByteArray format:nil>
	^ atpThumb
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpThumb: anObject [
	atpThumb := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpTitle [
	<atpType:#String format:nil>
	^ atpTitle
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpTitle: anObject [
	atpTitle := anObject
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpUri [
	<atpType:#String format:'uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedExternalExternal >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> thumbDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Thumb';
		accessor: #atpThumb
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> titleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		accessor: #atpTitle;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedExternalExternal >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
