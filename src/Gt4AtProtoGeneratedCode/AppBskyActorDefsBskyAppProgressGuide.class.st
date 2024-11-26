Class {
	#name : #AppBskyActorDefsBskyAppProgressGuide,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpGuide'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide class >> atpDescription [
 ^  'If set, an active progress guide. Once completed, can be set to undefined. Should have unspecced fields tracking progress.'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide class >> atpRecordName [
 ^ 'app.bsky.actor.defs#bskyAppProgressGuide'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide class >> atpSchema [
 ^ '{"description":"If set, an active progress guide. Once completed, can be set to undefined. Should have unspecced fields tracking progress.","type":"object","required":["guide"],"properties":{"guide":{"type":"string","maxLength":100}}}'
]

{ #category : #serialization }
AppBskyActorDefsBskyAppProgressGuide class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpGuide: (aRequest at: 'guide' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide >> atpGuide [
	<atpType:#String format:nil>
	^ atpGuide
]

{ #category : #accessing }
AppBskyActorDefsBskyAppProgressGuide >> atpGuide: anObject [
	atpGuide := anObject
]

{ #category : #magritte }
AppBskyActorDefsBskyAppProgressGuide >> guideDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Guide';
		accessor: #atpGuide;
		beRequired
]
