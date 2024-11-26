Class {
	#name : #AppBskyFeedDefsGeneratorViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLike'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState class >> atpRecordName [
 ^ 'app.bsky.feed.defs#generatorViewerState'
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState class >> atpSchema [
 ^ '{"type":"object","properties":{"like":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsGeneratorViewerState class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpLike: (aRequest at: 'like' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState >> atpLike [
	<atpType:#String format:'at-uri'>
	^ atpLike
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorViewerState >> atpLike: anObject [
	atpLike := anObject
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorViewerState >> likeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Like';
		accessor: #atpLike
]
