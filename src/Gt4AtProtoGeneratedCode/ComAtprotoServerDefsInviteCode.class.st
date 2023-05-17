Class {
	#name : #ComAtprotoServerDefsInviteCode,
	#superclass : #GtApModelEntity,
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

{ #category : #accessing }
ComAtprotoServerDefsInviteCode class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode class >> atpFile [
 ^ 'com/atproto/server/defs.json'
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode class >> atpRecordName [
 ^ 'com.atproto.server.defs#inviteCode'
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode class >> atpSchema [
 ^ '{"type":"object","required":["code","available","disabled","forAccount","createdBy","createdAt","uses"],"properties":{"code":{"type":"string"},"available":{"type":"integer"},"disabled":{"type":"boolean"},"forAccount":{"type":"string"},"createdBy":{"type":"string"},"createdAt":{"type":"string","format":"datetime"},"uses":{"type":"array","items":{"type":"ref","ref":"#inviteCodeUse"}}}}'
]

{ #category : #serialization }
ComAtprotoServerDefsInviteCode class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCode: (aRequest at: 'code' ifAbsent: [ nil ]);
		atpAvailable: (aRequest at: 'available' ifAbsent: [ nil ]);
		atpDisabled: (aRequest at: 'disabled' ifAbsent: [ nil ]);
		atpForAccount: (aRequest at: 'forAccount' ifAbsent: [ nil ]);
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpUses: (aRequest
				at: 'uses'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoServerDefsInviteCodeUse fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpAvailable [
	<atpType:#Number format:nil>
	^ atpAvailable
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpAvailable: anObject [
	atpAvailable := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCode [
	<atpType:#String format:nil>
	^ atpCode
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCode: anObject [
	atpCode := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedBy [
	<atpType:#String format:nil>
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpDisabled [
	<atpType:#Boolean format:nil>
	^ atpDisabled
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpDisabled: anObject [
	atpDisabled := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpForAccount [
	<atpType:#String format:nil>
	^ atpForAccount
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpForAccount: anObject [
	atpForAccount := anObject
]

{ #category : #accessing }
ComAtprotoServerDefsInviteCode >> atpUses [
	<atpType:#ComAtprotoServerDefsInviteCodeUse format:nil>
	<atpCollection>
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
