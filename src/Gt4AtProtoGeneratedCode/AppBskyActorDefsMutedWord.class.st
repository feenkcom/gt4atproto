Class {
	#name : #AppBskyActorDefsMutedWord,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpValue',
		'atpTargets',
		'atpActorTarget',
		'atpExpiresAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsMutedWord class >> atpDescription [
 ^  'A word that the account owner has muted.'
]

{ #category : #accessing }
AppBskyActorDefsMutedWord class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsMutedWord class >> atpRecordName [
 ^ 'app.bsky.actor.defs#mutedWord'
]

{ #category : #accessing }
AppBskyActorDefsMutedWord class >> atpSchema [
 ^ '{"type":"object","description":"A word that the account owner has muted.","required":["value","targets"],"properties":{"id":{"type":"string"},"value":{"type":"string","description":"The muted word itself.","maxLength":10000,"maxGraphemes":1000},"targets":{"type":"array","description":"The intended targets of the muted word.","items":{"type":"ref","ref":"app.bsky.actor.defs#mutedWordTarget"}},"actorTarget":{"type":"string","description":"Groups of users to apply the muted word to. If undefined, applies to all users.","knownValues":["all","exclude-following"],"default":"all"},"expiresAt":{"type":"string","format":"datetime","description":"The date and time at which the muted word will expire and no longer be applied."}}}'
]

{ #category : #serialization }
AppBskyActorDefsMutedWord class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ]);
		atpTargets: (aRequest
				at: 'targets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | String fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpActorTarget: (aRequest at: 'actorTarget' ifAbsent: [ nil ]);
		atpExpiresAt: (aRequest at: 'expiresAt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyActorDefsMutedWord >> actorTargetDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ActorTarget';
		accessor: #atpActorTarget
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpActorTarget [
	<atpType:#String format:nil>
	^ atpActorTarget
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpActorTarget: anObject [
	atpActorTarget := anObject
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpExpiresAt [
	<atpType:#String format:'datetime'>
	^ atpExpiresAt
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpExpiresAt: anObject [
	atpExpiresAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpTargets [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpTargets
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpTargets: anObject [
	atpTargets := anObject
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpValue [
	<atpType:#String format:nil>
	^ atpValue
]

{ #category : #accessing }
AppBskyActorDefsMutedWord >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
AppBskyActorDefsMutedWord >> expiresAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ExpiresAt';
		accessor: #atpExpiresAt
]

{ #category : #magritte }
AppBskyActorDefsMutedWord >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId
]

{ #category : #magritte }
AppBskyActorDefsMutedWord >> targetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Targets';
		accessor: #atpTargets;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsMutedWord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
