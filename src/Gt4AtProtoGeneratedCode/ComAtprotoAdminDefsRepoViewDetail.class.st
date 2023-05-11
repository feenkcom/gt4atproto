Class {
	#name : #ComAtprotoAdminDefsRepoViewDetail,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHandle',
		'atProtoEmail',
		'atProtoRelatedRecords',
		'atProtoIndexedAt',
		'atProtoModeration',
		'atProtoLabels',
		'atProtoInvitedBy',
		'atProtoInvites',
		'atProtoInvitesDisabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRepoViewDetail class >> fromRequest: aRequest [
	^ self new atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atProtoHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atProtoEmail: (aRequest at: 'email' ifAbsent: [ nil ]); 
		atProtoRelatedRecords: (aRequest at: 'relatedRecords' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atProtoModeration: (ComAtprotoAdminDefsModerationDetail fromRequest: (aRequest at: 'moderation' ifAbsent: [ nil ])); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ]); 
		atProtoInvitedBy: (ComAtprotoServerDefsInviteCode fromRequest: (aRequest at: 'invitedBy' ifAbsent: [ nil ])); 
		atProtoInvites: (aRequest at: 'invites' ifAbsent: [ nil ]); 
		atProtoInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoEmail [
	^ atProtoEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoEmail: anObject [
	atProtoEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	^ atProtoInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atProtoInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvites [
	^ atProtoInvites
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvites: anObject [
	atProtoInvites := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvitesDisabled [
	^ atProtoInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoInvitesDisabled: anObject [
	atProtoInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoModeration [
	<referenceTo:'#moderationDetail'>
	^ atProtoModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atProtoModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoRelatedRecords [
	^ atProtoRelatedRecords
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atProtoRelatedRecords: anObject [
	atProtoRelatedRecords := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atProtoEmail
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atProtoInvitedBy
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCode};
		label: 'Invites';
		accessor: #atProtoInvites
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atProtoInvitesDisabled
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atProtoModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atProtoRelatedRecords;
	beRequired
]
