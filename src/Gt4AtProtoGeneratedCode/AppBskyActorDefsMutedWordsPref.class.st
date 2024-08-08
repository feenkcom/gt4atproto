Class {
	#name : #AppBskyActorDefsMutedWordsPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpItems'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#mutedWordsPref'
]

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref class >> atpSchema [
 ^ '{"type":"object","required":["items"],"properties":{"items":{"type":"array","items":{"type":"ref","ref":"app.bsky.actor.defs#mutedWord"},"description":"A list of words the account owner has muted."}}}'
]

{ #category : #serialization }
AppBskyActorDefsMutedWordsPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpItems: (aRequest
				at: 'items'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyActorDefsMutedWord fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref >> atpItems [
	<atpType:#AppBskyActorDefsMutedWord format:nil>
	<atpCollection>
	^ atpItems
]

{ #category : #accessing }
AppBskyActorDefsMutedWordsPref >> atpItems: anObject [
	atpItems := anObject
]

{ #category : #magritte }
AppBskyActorDefsMutedWordsPref >> itemsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyActorDefsMutedWord};
		label: 'Items';
		accessor: #atpItems;
		beRequired
]
