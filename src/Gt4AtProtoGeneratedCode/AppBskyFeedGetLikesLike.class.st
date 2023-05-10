Class {
	#name : #AppBskyFeedGetLikesLike,
	#superclass : #Object,
	#instVars : [
		'atProtoIndexedAt',
		'atProtoCreatedAt',
		'atProtoActor'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #magritte }
AppBskyFeedGetLikesLike >> actorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Actor';
		accessor: #atProtoActor;
		beRequired
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoActor [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	^ atProtoActor
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoActor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atProtoActor := anObject
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #magritte }
AppBskyFeedGetLikesLike >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedGetLikesLike >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]
