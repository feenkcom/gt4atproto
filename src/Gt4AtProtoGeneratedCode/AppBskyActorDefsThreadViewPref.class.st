Class {
	#name : #AppBskyActorDefsThreadViewPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSort',
		'atpPrioritizeFollowedUsers'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsThreadViewPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#threadViewPref'
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref class >> atpSchema [
 ^ '{"type":"object","properties":{"sort":{"type":"string","description":"Sorting mode for threads.","knownValues":["oldest","newest","most-likes","random"]},"prioritizeFollowedUsers":{"type":"boolean","description":"Show followed users at the top of all replies."}}}'
]

{ #category : #serialization }
AppBskyActorDefsThreadViewPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSort: (aRequest at: 'sort' ifAbsent: [ nil ]);
		atpPrioritizeFollowedUsers: (aRequest at: 'prioritizeFollowedUsers' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref >> atpPrioritizeFollowedUsers [
	<atpType:#Boolean format:nil>
	^ atpPrioritizeFollowedUsers
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref >> atpPrioritizeFollowedUsers: anObject [
	atpPrioritizeFollowedUsers := anObject
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref >> atpSort [
	<atpType:#String format:nil>
	^ atpSort
]

{ #category : #accessing }
AppBskyActorDefsThreadViewPref >> atpSort: anObject [
	atpSort := anObject
]

{ #category : #magritte }
AppBskyActorDefsThreadViewPref >> prioritizeFollowedUsersDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'PrioritizeFollowedUsers';
		accessor: #atpPrioritizeFollowedUsers
]

{ #category : #magritte }
AppBskyActorDefsThreadViewPref >> sortDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Sort';
		accessor: #atpSort
]
