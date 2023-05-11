Class {
	#name : #AppBskyActorDefsViewerState,
	#superclass : #Object,
	#instVars : [
		'atpMuted',
		'atpBlockedBy',
		'atpBlocking',
		'atpFollowing',
		'atpFollowedBy'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyActorDefsViewerState class >> fromRequest: aRequest [
	^ self new atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ]); 
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
AppBskyActorDefsViewerState >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atpMuted
]
