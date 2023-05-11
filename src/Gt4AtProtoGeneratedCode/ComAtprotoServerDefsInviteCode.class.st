Class {
	#name : #ComAtprotoServerDefsInviteCode,
	#superclass : #Object,
	#instVars : [
		'atpCode',
		'atpAvailable',
		'atpDisabled',
		'atpForAccount',
		'atpCreatedBy',
		'atpCreatedAt',
		'atpUses'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerDefsInviteCode class >> fromRequest: aRequest [
	^ self new atpCode: (aRequest at: 'code' ifAbsent: [ nil ]); 
		atpAvailable: (aRequest at: 'available' ifAbsent: [ nil ]); 
		atpDisabled: (aRequest at: 'disabled' ifAbsent: [ nil ]); 
		atpForAccount: (aRequest at: 'forAccount' ifAbsent: [ nil ]); 
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpUses: (aRequest at: 'uses' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpAvailable [
	^ atpAvailable
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpAvailable: anObject [
	atpAvailable := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCode [
	^ atpCode
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCode: anObject [
	atpCode := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedBy [
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpDisabled [
	^ atpDisabled
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpDisabled: anObject [
	atpDisabled := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpForAccount [
	^ atpForAccount
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpForAccount: anObject [
	atpForAccount := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpUses [
	^ atpUses
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpUses: anObject [
	atpUses := anObject
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> availableDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Available';
		accessor: #atpAvailable;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> codeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Code';
		accessor: #atpCode;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> disabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Disabled';
		accessor: #atpDisabled;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> forAccountDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ForAccount';
		accessor: #atpForAccount;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerDefsInviteCode >> usesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCodeUse};
		label: 'Uses';
		accessor: #atpUses;
	beRequired
]
