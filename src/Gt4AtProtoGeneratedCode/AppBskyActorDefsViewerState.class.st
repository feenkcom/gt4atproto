Class {
	#name : #AppBskyActorDefsViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpMuted',
		'atpMutedByList',
		'atpBlockedBy',
		'atpBlocking',
		'atpFollowing',
		'atpFollowedBy'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyActorDefsViewerState class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ]); 
		atpMutedByList: (aRequest at: 'mutedByList' ifPresent: [:aValue | AppBskyGraphDefsListViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpBlockedBy: (aRequest at: 'blockedBy' ifAbsent: [ nil ]); 
		atpBlocking: (aRequest at: 'blocking' ifAbsent: [ nil ]); 
		atpFollowing: (aRequest at: 'following' ifAbsent: [ nil ]); 
		atpFollowedBy: (aRequest at: 'followedBy' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockedBy [
	^ atpBlockedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlockedBy: anObject [
	atpBlockedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlocking [
	^ atpBlocking
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpBlocking: anObject [
	atpBlocking := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowedBy [
	^ atpFollowedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowedBy: anObject [
	atpFollowedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowing [
	^ atpFollowing
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpFollowing: anObject [
	atpFollowing := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMuted [
	^ atpMuted
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMuted: anObject [
	atpMuted := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atpMutedByList [
	<referenceTo:'app.bsky.graph.defs#listViewBasic'>
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
