Class {
	#name : #AppBskyGraphDefsRelationship,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpFollowing',
		'atpFollowedBy'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsRelationship class >> atpDescription [
 ^  'lists the bi-directional graph relationships between one actor (not indicated in the object), and the target actors (the DID included in the object)'
]

{ #category : #accessing }
AppBskyGraphDefsRelationship class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsRelationship class >> atpRecordName [
 ^ 'app.bsky.graph.defs#relationship'
]

{ #category : #accessing }
AppBskyGraphDefsRelationship class >> atpSchema [
 ^ '{"type":"object","description":"lists the bi-directional graph relationships between one actor (not indicated in the object), and the target actors (the DID included in the object)","required":["did"],"properties":{"did":{"type":"string","format":"did"},"following":{"type":"string","format":"at-uri","description":"if the actor follows this DID, this is the AT-URI of the follow record"},"followedBy":{"type":"string","format":"at-uri","description":"if the actor is followed by this DID, contains the AT-URI of the follow record"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsRelationship class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpFollowing: (aRequest at: 'following' ifAbsent: [ nil ]);
		atpFollowedBy: (aRequest at: 'followedBy' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpFollowedBy [
	<atpType:#String format:'at-uri'>
	^ atpFollowedBy
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpFollowedBy: anObject [
	atpFollowedBy := anObject
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpFollowing [
	<atpType:#String format:'at-uri'>
	^ atpFollowing
]

{ #category : #accessing }
AppBskyGraphDefsRelationship >> atpFollowing: anObject [
	atpFollowing := anObject
]

{ #category : #magritte }
AppBskyGraphDefsRelationship >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsRelationship >> followedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FollowedBy';
		accessor: #atpFollowedBy
]

{ #category : #magritte }
AppBskyGraphDefsRelationship >> followingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Following';
		accessor: #atpFollowing
]
