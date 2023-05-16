Class {
	#name : #AppBskyFeedGetLikesLike,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpIndexedAt',
		'atpCreatedAt',
		'atpActor'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedGetLikesLike class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedGetLikesLike class >> atpFile [
 ^ 'app/bsky/feed/getLikes.json'
]

{ #category : #accessing }
AppBskyFeedGetLikesLike class >> atpRecordName [
 ^ 'app.bsky.feed.getLikes#like'
]

{ #category : #accessing }
AppBskyFeedGetLikesLike class >> atpSchema [
 ^ '{"type":"object","required":["indexedAt","createdAt","actor"],"properties":{"indexedAt":{"type":"string","format":"datetime"},"createdAt":{"type":"string","format":"datetime"},"actor":{"type":"ref","ref":"app.bsky.actor.defs#profileView"}}}'
]

{ #category : #serialization }
AppBskyFeedGetLikesLike class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpActor: (aRequest
				at: 'actor'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyFeedGetLikesLike >> actorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Actor';
		accessor: #atpActor;
		beRequired
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpActor [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	^ atpActor
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpActor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpActor := anObject
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpCreatedAt [
	<atpType:'string' format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpIndexedAt [
	<atpType:'string' format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #magritte }
AppBskyFeedGetLikesLike >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedGetLikesLike >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]
