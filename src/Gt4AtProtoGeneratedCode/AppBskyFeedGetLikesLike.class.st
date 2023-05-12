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

{ #category : #serialization }
AppBskyFeedGetLikesLike class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpActor: (aRequest at: 'actor' ifPresent: [:aValue | AppBskyActorDefsProfileView fromRequest: aValue ] ifAbsent: [ nil ])
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
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedGetLikesLike >> atpIndexedAt [
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
