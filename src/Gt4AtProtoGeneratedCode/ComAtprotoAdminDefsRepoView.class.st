Class {
	#name : #ComAtprotoAdminDefsRepoView,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHandle',
		'atProtoEmail',
		'atProtoRelatedRecords',
		'atProtoIndexedAt',
		'atProtoModeration',
		'atProtoInvitedBy',
		'atProtoInvitesDisabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRepoView class >> fromRequest: aRequest [
	^ self new atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atProtoHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atProtoEmail: (aRequest at: 'email' ifAbsent: [ nil ]); 
		atProtoRelatedRecords: (aRequest at: 'relatedRecords' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atProtoModeration: (ComAtprotoAdminDefsModeration fromRequest: (aRequest at: 'moderation' ifAbsent: [ nil ])); 
		atProtoInvitedBy: (ComAtprotoServerDefsInviteCode fromRequest: (aRequest at: 'invitedBy' ifAbsent: [ nil ])); 
		atProtoInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoEmail [
	^ atProtoEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoEmail: anObject [
	atProtoEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	^ atProtoInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atProtoInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoInvitesDisabled [
	^ atProtoInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoInvitesDisabled: anObject [
	atProtoInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoModeration [
	<referenceTo:'#moderation'>
	^ atProtoModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoModeration: anObject [
	<referenceTo:'#moderation'>
	atProtoModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoRelatedRecords [
	^ atProtoRelatedRecords
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atProtoRelatedRecords: anObject [
	atProtoRelatedRecords := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atProtoEmail
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atProtoInvitedBy
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atProtoInvitesDisabled
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atProtoModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atProtoRelatedRecords;
	beRequired
]
