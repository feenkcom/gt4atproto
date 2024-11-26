Class {
	#name : #AppBskyActorDefsHiddenPostsPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpItems'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#hiddenPostsPref'
]

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref class >> atpSchema [
 ^ '{"type":"object","required":["items"],"properties":{"items":{"type":"array","items":{"type":"string","format":"at-uri"},"description":"A list of URIs of posts the account owner has hidden."}}}'
]

{ #category : #serialization }
AppBskyActorDefsHiddenPostsPref class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpItems: (aRequest
				at: 'items'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref >> atpItems [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpItems
]

{ #category : #accessing }
AppBskyActorDefsHiddenPostsPref >> atpItems: anObject [
	atpItems := anObject
]

{ #category : #magritte }
AppBskyActorDefsHiddenPostsPref >> itemsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Items';
		accessor: #atpItems;
		beRequired
]
