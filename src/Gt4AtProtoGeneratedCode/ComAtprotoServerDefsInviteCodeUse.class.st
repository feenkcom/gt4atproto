Class {
	#name : #ComAtprotoServerDefsInviteCodeUse,
	#superclass : #Object,
	#instVars : [
		'atProtoUsedBy',
		'atProtoUsedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atProtoUsedAt [
	^ atProtoUsedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atProtoUsedAt: anObject [
	atProtoUsedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atProtoUsedBy [
	^ atProtoUsedBy
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCodeUse >> atProtoUsedBy: anObject [
	atProtoUsedBy := anObject
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCodeUse >> usedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UsedAt';
		accessor: #atProtoUsedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCodeUse >> usedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UsedBy';
		accessor: #atProtoUsedBy;
	beRequired
]
