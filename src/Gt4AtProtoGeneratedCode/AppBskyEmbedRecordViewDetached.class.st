Class {
	#name : #AppBskyEmbedRecordViewDetached,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpDetached'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewDetached class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached class >> atpFile [
 ^ 'app/bsky/embed/record.json'
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewDetached'
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached class >> atpSchema [
 ^ '{"type":"object","required":["uri","detached"],"properties":{"uri":{"type":"string","format":"at-uri"},"detached":{"type":"boolean","const":true}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordViewDetached class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpDetached: (aRequest at: 'detached' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached >> atpDetached [
	<atpType:#Boolean format:nil>
	^ atpDetached
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached >> atpDetached: anObject [
	atpDetached := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewDetached >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewDetached >> detachedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Detached';
		accessor: #atpDetached;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewDetached >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
