Class {
	#name : #AppBskyFeedDefsNotFoundPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpNotFound'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#notFoundPost'
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost class >> atpSchema [
 ^ '{"type":"object","required":["uri","notFound"],"properties":{"uri":{"type":"string","format":"at-uri"},"notFound":{"type":"boolean","const":true}}}'
]

{ #category : #serialization }
AppBskyFeedDefsNotFoundPost class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpNotFound: (aRequest at: 'notFound' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpNotFound [
	<atpType:#Boolean format:nil>
	^ atpNotFound
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpNotFound: anObject [
	atpNotFound := anObject
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> notFoundDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'NotFound';
		accessor: #atpNotFound;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
