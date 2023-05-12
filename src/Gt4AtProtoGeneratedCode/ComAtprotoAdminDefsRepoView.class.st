Class {
	#name : #ComAtprotoAdminDefsRepoView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpEmail',
		'atpRelatedRecords',
		'atpIndexedAt',
		'atpModeration',
		'atpInvitedBy',
		'atpInvitesDisabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoView'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atpEmail: (aRequest at: 'email' ifAbsent: [ nil ]); 
		atpRelatedRecords: (aRequest at: 'relatedRecords' ifPresent: [:anArray | anArray collect: [:aValue |GtApModelEntity findForRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atpModeration: (aRequest at: 'moderation' ifPresent: [:aValue | ComAtprotoAdminDefsModeration fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpInvitedBy: (aRequest at: 'invitedBy' ifPresent: [:aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpEmail [
	^ atpEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpHandle [
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	^ atpInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitesDisabled [
	^ atpInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpModeration [
	<referenceTo:'#moderation'>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpRelatedRecords [
	^ atpRelatedRecords
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpRelatedRecords: anObject [
	atpRelatedRecords := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atpInvitedBy
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atpInvitesDisabled
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoView >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atpRelatedRecords;
	beRequired
]
