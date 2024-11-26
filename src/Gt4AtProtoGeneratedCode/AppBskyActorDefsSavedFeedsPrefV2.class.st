Class {
	#name : #AppBskyActorDefsSavedFeedsPrefV2,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpItems'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 class >> atpRecordName [
 ^ 'app.bsky.actor.defs#savedFeedsPrefV2'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 class >> atpSchema [
 ^ '{"type":"object","required":["items"],"properties":{"items":{"type":"array","items":{"type":"ref","ref":"app.bsky.actor.defs#savedFeed"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsSavedFeedsPrefV2 class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpItems: (aRequest
				at: 'items'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyActorDefsSavedFeed fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 >> atpItems [
	<atpType:#AppBskyActorDefsSavedFeed format:nil>
	<atpCollection>
	^ atpItems
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPrefV2 >> atpItems: anObject [
	atpItems := anObject
]

{ #category : #magritte }
AppBskyActorDefsSavedFeedsPrefV2 >> itemsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyActorDefsSavedFeed};
		label: 'Items';
		accessor: #atpItems;
		beRequired
]
