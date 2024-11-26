Class {
	#name : #AppBskyUnspeccedDefsSkeletonSearchPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost class >> atpFile [
 ^ 'app/bsky/unspecced/defs.json'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost class >> atpRecordName [
 ^ 'app.bsky.unspecced.defs#skeletonSearchPost'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyUnspeccedDefsSkeletonSearchPost class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchPost >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyUnspeccedDefsSkeletonSearchPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
