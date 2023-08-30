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
		'atpInvitesDisabled',
		'atpInviteNote'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoView'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView class >> atpSchema [
 ^ '{"type":"object","required":["did","handle","relatedRecords","indexedAt","moderation"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"email":{"type":"string"},"relatedRecords":{"type":"array","items":{"type":"unknown"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderation"},"invitedBy":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"},"invitesDisabled":{"type":"boolean"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpEmail: (aRequest at: 'email' ifAbsent: [ nil ]);
		atpRelatedRecords: (aRequest
				at: 'relatedRecords'
				ifPresent: [ :anArray | anArray collect: [ :aValue | GtApModelEntity findForRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpModeration: (aRequest
				at: 'moderation'
				ifPresent: [ :aValue | ComAtprotoAdminDefsModeration fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpInvitedBy: (aRequest
				at: 'invitedBy'
				ifPresent: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpEmail [
	<atpType:#String format:nil>
	^ atpEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInviteNote [
	<atpType:#String format:nil>
	^ atpInviteNote
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInviteNote: anObject [
	atpInviteNote := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	^ atpInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitesDisabled [
	<atpType:#Boolean format:nil>
	^ atpInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpModeration [
	<referenceTo:'#moderation'>
	<atpType:#ComAtprotoAdminDefsModeration format:nil>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoView >> atpRelatedRecords [
	<atpType:#Object format:nil>
	<atpCollection>
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
ComAtprotoAdminDefsRepoView >> inviteNoteDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'InviteNote';
		accessor: #atpInviteNote
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
