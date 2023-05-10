Class {
	#name : #AppBskyActorDefsViewerState,
	#superclass : #Object,
	#instVars : [
		'atProtoMuted',
		'atProtoBlockedBy',
		'atProtoBlocking',
		'atProtoFollowing',
		'atProtoFollowedBy'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoBlockedBy [
	^ atProtoBlockedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoBlockedBy: anObject [
	atProtoBlockedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoBlocking [
	^ atProtoBlocking
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoBlocking: anObject [
	atProtoBlocking := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoFollowedBy [
	^ atProtoFollowedBy
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoFollowedBy: anObject [
	atProtoFollowedBy := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoFollowing [
	^ atProtoFollowing
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoFollowing: anObject [
	atProtoFollowing := anObject
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoMuted [
	^ atProtoMuted
]

{ #category : #accessing }
AppBskyActorDefsViewerState >> atProtoMuted: anObject [
	atProtoMuted := anObject
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> blockedByDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'BlockedBy';
		accessor: #atProtoBlockedBy
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> blockingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Blocking';
		accessor: #atProtoBlocking
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> followedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FollowedBy';
		accessor: #atProtoFollowedBy
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> followingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Following';
		accessor: #atProtoFollowing
]

{ #category : #magritte }
AppBskyActorDefsViewerState >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atProtoMuted
]
