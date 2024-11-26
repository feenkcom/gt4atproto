Class {
	#name : #AppBskyUnspeccedDefsSkeletonSearchStarterPack,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack class >> atpFile [
 ^ 'app/bsky/unspecced/defs.json'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack class >> atpRecordName [
 ^ 'app.bsky.unspecced.defs#skeletonSearchStarterPack'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyUnspeccedDefsSkeletonSearchStarterPack class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchStarterPack >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyUnspeccedDefsSkeletonSearchStarterPack >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
