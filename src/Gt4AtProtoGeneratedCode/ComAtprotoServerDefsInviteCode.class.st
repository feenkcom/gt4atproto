Class {
	#name : #ComAtprotoServerDefsInviteCode,
	#superclass : #Object,
	#instVars : [
		'atProtoCode',
		'atProtoAvailable',
		'atProtoDisabled',
		'atProtoForAccount',
		'atProtoCreatedBy',
		'atProtoCreatedAt',
		'atProtoUses'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerDefsInviteCode class >> fromRequest: aRequest [
	^ self new atProtoCode: (aRequest at: 'code' ifAbsent: [ nil ]); 
		atProtoAvailable: (aRequest at: 'available' ifAbsent: [ nil ]); 
		atProtoDisabled: (aRequest at: 'disabled' ifAbsent: [ nil ]); 
		atProtoForAccount: (aRequest at: 'forAccount' ifAbsent: [ nil ]); 
		atProtoCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atProtoUses: (aRequest at: 'uses' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoAvailable [
	^ atProtoAvailable
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoAvailable: anObject [
	atProtoAvailable := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCode [
	^ atProtoCode
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCode: anObject [
	atProtoCode := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCreatedBy [
	^ atProtoCreatedBy
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoCreatedBy: anObject [
	atProtoCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoDisabled [
	^ atProtoDisabled
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoDisabled: anObject [
	atProtoDisabled := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoForAccount [
	^ atProtoForAccount
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoForAccount: anObject [
	atProtoForAccount := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoUses [
	^ atProtoUses
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atProtoUses: anObject [
	atProtoUses := anObject
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> availableDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Available';
		accessor: #atProtoAvailable;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> codeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Code';
		accessor: #atProtoCode;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atProtoCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> disabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Disabled';
		accessor: #atProtoDisabled;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> forAccountDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ForAccount';
		accessor: #atProtoForAccount;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> usesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCodeUse};
		label: 'Uses';
		accessor: #atProtoUses;
	beRequired
]
