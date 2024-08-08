Class {
	#name : #AppBskyActorDefsLabelerPrefItem,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem class >> atpRecordName [
 ^ 'app.bsky.actor.defs#labelerPrefItem'
]

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
AppBskyActorDefsLabelerPrefItem class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyActorDefsLabelerPrefItem >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
AppBskyActorDefsLabelerPrefItem >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]
