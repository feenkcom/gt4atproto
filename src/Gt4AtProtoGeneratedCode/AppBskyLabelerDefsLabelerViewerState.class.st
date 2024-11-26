Class {
	#name : #AppBskyLabelerDefsLabelerViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLike'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState class >> atpFile [
 ^ 'app/bsky/labeler/defs.json'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState class >> atpRecordName [
 ^ 'app.bsky.labeler.defs#labelerViewerState'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState class >> atpSchema [
 ^ '{"type":"object","properties":{"like":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyLabelerDefsLabelerViewerState class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpLike: (aRequest at: 'like' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState >> atpLike [
	<atpType:#String format:'at-uri'>
	^ atpLike
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewerState >> atpLike: anObject [
	atpLike := anObject
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewerState >> likeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Like';
		accessor: #atpLike
]
