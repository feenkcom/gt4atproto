Class {
	#name : #AppBskyUnspeccedDefsSkeletonSearchActor,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor class >> atpFile [
 ^ 'app/bsky/unspecced/defs.json'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor class >> atpRecordName [
 ^ 'app.bsky.unspecced.defs#skeletonSearchActor'
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
AppBskyUnspeccedDefsSkeletonSearchActor class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyUnspeccedDefsSkeletonSearchActor >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
AppBskyUnspeccedDefsSkeletonSearchActor >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]
