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
 ^ ''
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse class >> atpRecordName [
 ^ 'com.atproto.server.defs#inviteCodeUse'
]

{ #category : #serialization }
ComAtprotoServerDefsInviteCodeUse class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUsedBy: (aRequest at: 'usedBy' ifAbsent: [ nil ]); 
		atpUsedAt: (aRequest at: 'usedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedAt [
	^ atpUsedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedAt: anObject [
	atpUsedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atpUsedBy [
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
