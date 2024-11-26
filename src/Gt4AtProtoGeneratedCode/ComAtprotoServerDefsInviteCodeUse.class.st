Class {
	#name : #ComAtprotoServerDefsInviteCodeUse,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUsedBy',
		'atpUsedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse class >> atpFile [
 ^ 'com/atproto/server/defs.json'
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse class >> atpRecordName [
 ^ 'com.atproto.server.defs#inviteCodeUse'
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse class >> atpSchema [
 ^ '{"type":"object","required":["usedBy","usedAt"],"properties":{"usedBy":{"type":"string","format":"did"},"usedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoServerDefsInviteCodeUse class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUsedBy: (aRequest at: 'usedBy' ifAbsent: [ nil ]);
		atpUsedAt: (aRequest at: 'usedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedAt [
	<atpType:#String format:'datetime'>
	^ atpUsedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedAt: anObject [
	atpUsedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedBy [
	<atpType:#String format:'did'>
	^ atpUsedBy
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedBy: anObject [
	atpUsedBy := anObject
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCodeUse >> usedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UsedAt';
		accessor: #atpUsedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCodeUse >> usedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UsedBy';
		accessor: #atpUsedBy;
		beRequired
]
