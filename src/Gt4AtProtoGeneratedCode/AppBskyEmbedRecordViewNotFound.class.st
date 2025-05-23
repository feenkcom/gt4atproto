Class {
	#name : #AppBskyEmbedRecordViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpNotFound'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpFile [
 ^ 'app/bsky/embed/record.json'
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewNotFound'
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["uri","notFound"],"properties":{"uri":{"type":"string","format":"at-uri"},"notFound":{"type":"boolean","const":true}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordViewNotFound class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpNotFound: (aRequest at: 'notFound' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpNotFound [
	<atpType:#Boolean format:nil>
	^ atpNotFound
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpNotFound: anObject [
	atpNotFound := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewNotFound >> notFoundDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'NotFound';
		accessor: #atpNotFound;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewNotFound >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
