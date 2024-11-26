Class {
	#name : #AppBskyFeedDefsBlockedAuthor,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpViewer'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor class >> atpRecordName [
 ^ 'app.bsky.feed.defs#blockedAuthor'
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"},"viewer":{"type":"ref","ref":"app.bsky.actor.defs#viewerState"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsBlockedAuthor class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyActorDefsViewerState fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor >> atpViewer [
	<referenceTo:'app.bsky.actor.defs#viewerState'>
	<atpType:#AppBskyActorDefsViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyFeedDefsBlockedAuthor >> atpViewer: anObject [
	<referenceTo:'app.bsky.actor.defs#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyFeedDefsBlockedAuthor >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsBlockedAuthor >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
