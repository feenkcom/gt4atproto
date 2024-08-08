Class {
	#name : #ToolsOzoneModerationDefsRepoView,
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
		'atpInviteNote',
		'atpDeactivatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#repoView'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView class >> atpSchema [
 ^ '{"type":"object","required":["did","handle","relatedRecords","indexedAt","moderation"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"email":{"type":"string"},"relatedRecords":{"type":"array","items":{"type":"unknown"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderation"},"invitedBy":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"},"invitesDisabled":{"type":"boolean"},"inviteNote":{"type":"string"},"deactivatedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRepoView class >> fromRequest: aRequest [
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
				ifPresent: [ :aValue | ToolsOzoneModerationDefsModeration fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpInvitedBy: (aRequest
				at: 'invitedBy'
				ifPresent: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ]);
		atpInviteNote: (aRequest at: 'inviteNote' ifAbsent: [ nil ]);
		atpDeactivatedAt: (aRequest at: 'deactivatedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpDeactivatedAt [
	<atpType:#String format:'datetime'>
	^ atpDeactivatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpDeactivatedAt: anObject [
	atpDeactivatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpEmail [
	<atpType:#String format:nil>
	^ atpEmail
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInviteNote [
	<atpType:#String format:nil>
	^ atpInviteNote
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInviteNote: anObject [
	atpInviteNote := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	^ atpInvitedBy
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInvitesDisabled [
	<atpType:#Boolean format:nil>
	^ atpInvitesDisabled
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpModeration [
	<referenceTo:'#moderation'>
	<atpType:#ToolsOzoneModerationDefsModeration format:nil>
	^ atpModeration
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpRelatedRecords [
	<atpType:#Object format:nil>
	<atpCollection>
	^ atpRelatedRecords
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoView >> atpRelatedRecords: anObject [
	atpRelatedRecords := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> deactivatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeactivatedAt';
		accessor: #atpDeactivatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> inviteNoteDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'InviteNote';
		accessor: #atpInviteNote
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atpInvitedBy
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atpInvitesDisabled
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoView >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atpRelatedRecords;
		beRequired
]
