Class {
	#name : #ComAtprotoAdminDefsAccountView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpEmail',
		'atpRelatedRecords',
		'atpIndexedAt',
		'atpInvitedBy',
		'atpInvites',
		'atpInvitesDisabled',
		'atpEmailConfirmedAt',
		'atpInviteNote',
		'atpDeactivatedAt',
		'atpThreatSignatures'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsAccountView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#accountView'
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView class >> atpSchema [
 ^ '{"type":"object","required":["did","handle","indexedAt"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"email":{"type":"string"},"relatedRecords":{"type":"array","items":{"type":"unknown"}},"indexedAt":{"type":"string","format":"datetime"},"invitedBy":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"},"invites":{"type":"array","items":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"}},"invitesDisabled":{"type":"boolean"},"emailConfirmedAt":{"type":"string","format":"datetime"},"inviteNote":{"type":"string"},"deactivatedAt":{"type":"string","format":"datetime"},"threatSignatures":{"type":"array","items":{"type":"ref","ref":"#threatSignature"}}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsAccountView class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpEmail: (aRequest at: 'email' ifAbsent: [ nil ]);
		atpRelatedRecords: (aRequest
				at: 'relatedRecords'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | GtApModelEntity findForRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpInvitedBy: (aRequest
				at: 'invitedBy'
				ifPresent: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpInvites: (aRequest
				at: 'invites'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ]);
		atpEmailConfirmedAt: (aRequest at: 'emailConfirmedAt' ifAbsent: [ nil ]);
		atpInviteNote: (aRequest at: 'inviteNote' ifAbsent: [ nil ]);
		atpDeactivatedAt: (aRequest at: 'deactivatedAt' ifAbsent: [ nil ]);
		atpThreatSignatures: (aRequest
				at: 'threatSignatures'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoAdminDefsThreatSignature fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpDeactivatedAt [
	<atpType:#String format:'datetime'>
	^ atpDeactivatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpDeactivatedAt: anObject [
	atpDeactivatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpEmail [
	<atpType:#String format:nil>
	^ atpEmail
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpEmailConfirmedAt [
	<atpType:#String format:'datetime'>
	^ atpEmailConfirmedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpEmailConfirmedAt: anObject [
	atpEmailConfirmedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInviteNote [
	<atpType:#String format:nil>
	^ atpInviteNote
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInviteNote: anObject [
	atpInviteNote := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	^ atpInvitedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvites [
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	<atpCollection>
	^ atpInvites
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvites: anObject [
	atpInvites := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvitesDisabled [
	<atpType:#Boolean format:nil>
	^ atpInvitesDisabled
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpRelatedRecords [
	<atpType:#Object format:nil>
	<atpCollection>
	^ atpRelatedRecords
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpRelatedRecords: anObject [
	atpRelatedRecords := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpThreatSignatures [
	<atpType:#ComAtprotoAdminDefsThreatSignature format:nil>
	<atpCollection>
	^ atpThreatSignatures
]

{ #category : #accessing }
ComAtprotoAdminDefsAccountView >> atpThreatSignatures: anObject [
	atpThreatSignatures := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> deactivatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeactivatedAt';
		accessor: #atpDeactivatedAt
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> emailConfirmedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'EmailConfirmedAt';
		accessor: #atpEmailConfirmedAt
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> inviteNoteDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'InviteNote';
		accessor: #atpInviteNote
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atpInvitedBy
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> invitesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCode};
		label: 'Invites';
		accessor: #atpInvites
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atpInvitesDisabled
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atpRelatedRecords
]

{ #category : #magritte }
ComAtprotoAdminDefsAccountView >> threatSignaturesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsThreatSignature};
		label: 'ThreatSignatures';
		accessor: #atpThreatSignatures
]
