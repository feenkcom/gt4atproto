Class {
	#name : #AppBskyActorDefsViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpMuted',
		'atpMutedByList',
		'atpBlockedBy',
		'atpBlocking',
		'atpBlockingByList',
		'atpFollowing',
		'atpFollowedBy',
		'atpKnownFollowers'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsViewerState class >> atpDescription [
 ^  'Metadata about the requesting account''s relationship with the subject account. Only has meaningful content for authed requests.'
]

{ #category : #accessing }
AppBskyActorDefsViewerState class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsViewerState class >> atpRecordName [
 ^ 'app.bsky.actor.defs#viewerState'
]

{ #category : #accessing }
AppBskyActorDefsViewerState class >> atpSchema [
 ^ '{"type":"object","description":"Metadata about the requesting account''s relationship with the subject account. Only has meaningful content for authed requests.","properties":{"muted":{"type":"boolean"},"mutedByList":{"type":"ref","ref":"app.bsky.graph.defs#listViewBasic"},"blockedBy":{"type":"boolean"},"blocking":{"type":"string","format":"at-uri"},"blockingByList":{"type":"ref","ref":"app.bsky.graph.defs#listViewBasic"},"following":{"type":"string","format":"at-uri"},"followedBy":{"type":"string","format":"at-uri"},"knownFollowers":{"type":"ref","ref":"#knownFollowers"}}}'
]

{ #category : #serialization }
AppBskyActorDefsViewerState class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ]);
		atpMutedByList: (aRequest
				at: 'mutedByList'
				ifPresent: [ :aValue | AppBskyGraphDefsListViewBasic fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpBlockedBy: (aRequest at: 'blockedBy' ifAbsent: [ nil ]);
		atpBlocking: (aRequest at: 'blocking' ifAbsent: [ nil ]);
		atpBlockingByList: (aRequest
				at: 'blockingByList'
				ifPresent: [ :aValue | AppBskyGraphDefsListViewBasic fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpFollowing: (aRequest at: 'following' ifAbsent: [ nil ]);
		atpFollowedBy: (aRequest at: 'followedBy' ifAbsent: [ nil ]);
		atpKnownFollowers: (aRequest
				at: 'knownFollowers'
				ifPresent: [ :aValue | AppBskyActorDefsKnownFollowers fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockedBy [
	<atpType:#Boolean format:nil>
	^ atpBlockedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockedBy: anObject [
	atpBlockedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlocking [
	<atpType:#String format:'at-uri'>
	^ atpBlocking
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlocking: anObject [
	atpBlocking := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockingByList [
	<referenceTo:'app.bsky.graph.defs#listViewBasic'>
	<atpType:#AppBskyGraphDefsListViewBasic format:nil>
	^ atpBlockingByList
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockingByList: anObject [
	<referenceTo:'app.bsky.graph.defs#listViewBasic'>
	atpBlockingByList := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowedBy [
	<atpType:#String format:'at-uri'>
	^ atpFollowedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowedBy: anObject [
	atpFollowedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowing [
	<atpType:#String format:'at-uri'>
	^ atpFollowing
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowing: anObject [
	atpFollowing := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpKnownFollowers [
	<referenceTo:'#knownFollowers'>
	<atpType:#AppBskyActorDefsKnownFollowers format:nil>
	^ atpKnownFollowers
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpKnownFollowers: anObject [
	<referenceTo:'#knownFollowers'>
	atpKnownFollowers := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMuted [
	<atpType:#Boolean format:nil>
	^ atpMuted
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMuted: anObject [
	atpMuted := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMutedByList [
	<referenceTo:'app.bsky.graph.defs#listViewBasic'>
	<atpType:#AppBskyGraphDefsListViewBasic format:nil>
	^ atpMutedByList
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMutedByList: anObject [
	<referenceTo:'app.bsky.graph.defs#listViewBasic'>
	atpMutedByList := anObject
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> blockedByDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'BlockedBy';
		accessor: #atpBlockedBy
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> blockingByListDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'BlockingByList';
		accessor: #atpBlockingByList
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> blockingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Blocking';
		accessor: #atpBlocking
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> followedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FollowedBy';
		accessor: #atpFollowedBy
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> followingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Following';
		accessor: #atpFollowing
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> knownFollowersDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'KnownFollowers';
		accessor: #atpKnownFollowers
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> mutedByListDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'MutedByList';
		accessor: #atpMutedByList
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atpMuted
]
