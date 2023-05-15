Class {
	#name : #ComAtprotoAdminDefsRepoViewDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpEmail',
		'atpRelatedRecords',
		'atpIndexedAt',
		'atpModeration',
		'atpLabels',
		'atpInvitedBy',
		'atpInvites',
		'atpInvitesDisabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoViewDetail'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["did","handle","relatedRecords","indexedAt","moderation"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"email":{"type":"string"},"relatedRecords":{"type":"array","items":{"type":"unknown"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderationDetail"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"invitedBy":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"},"invites":{"type":"array","items":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"}},"invitesDisabled":{"type":"boolean"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoViewDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atpEmail: (aRequest at: 'email' ifAbsent: [ nil ]); 
		atpRelatedRecords: (aRequest at: 'relatedRecords' ifPresent: [:anArray | anArray collect: [:aValue |GtApModelEntity findForRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atpModeration: (aRequest at: 'moderation' ifPresent: [:aValue | ComAtprotoAdminDefsModerationDetail fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoLabelDefsLabel fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpInvitedBy: (aRequest at: 'invitedBy' ifPresent: [:aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpInvites: (aRequest at: 'invites' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoServerDefsInviteCode fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpEmail [
	^ atpEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpHandle [
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	^ atpInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvites [
	^ atpInvites
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvites: anObject [
	atpInvites := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvitesDisabled [
	^ atpInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpModeration [
	<referenceTo:'#moderationDetail'>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpRelatedRecords [
	^ atpRelatedRecords
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewDetail >> atpRelatedRecords: anObject [
	atpRelatedRecords := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atpInvitedBy
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCode};
		label: 'Invites';
		accessor: #atpInvites
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atpInvitesDisabled
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewDetail >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atpRelatedRecords;
	beRequired
]
