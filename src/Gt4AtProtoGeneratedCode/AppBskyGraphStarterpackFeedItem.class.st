Class {
	#name : #AppBskyGraphStarterpackFeedItem,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem class >> atpFile [
 ^ 'app/bsky/graph/starterpack.json'
]

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem class >> atpRecordName [
 ^ 'app.bsky.graph.starterpack#feedItem'
]

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyGraphStarterpackFeedItem class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphStarterpackFeedItem >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyGraphStarterpackFeedItem >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
