Class {
	#name : #AppBskyActorDefsProfileAssociatedChat,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAllowIncoming'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat class >> atpRecordName [
 ^ 'app.bsky.actor.defs#profileAssociatedChat'
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat class >> atpSchema [
 ^ '{"type":"object","required":["allowIncoming"],"properties":{"allowIncoming":{"type":"string","knownValues":["all","none","following"]}}}'
]

{ #category : #serialization }
AppBskyActorDefsProfileAssociatedChat class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpAllowIncoming: (aRequest at: 'allowIncoming' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociatedChat >> allowIncomingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'AllowIncoming';
		accessor: #atpAllowIncoming;
		beRequired
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat >> atpAllowIncoming [
	<atpType:#String format:nil>
	^ atpAllowIncoming
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociatedChat >> atpAllowIncoming: anObject [
	atpAllowIncoming := anObject
]
