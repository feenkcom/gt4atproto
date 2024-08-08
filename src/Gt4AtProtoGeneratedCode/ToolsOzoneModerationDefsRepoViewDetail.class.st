Class {
	#name : #ToolsOzoneModerationDefsRepoViewDetail,
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
		'atpInvitesDisabled',
		'atpInviteNote',
		'atpEmailConfirmedAt',
		'atpDeactivatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#repoViewDetail'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["did","handle","relatedRecords","indexedAt","moderation"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"email":{"type":"string"},"relatedRecords":{"type":"array","items":{"type":"unknown"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderationDetail"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"invitedBy":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"},"invites":{"type":"array","items":{"type":"ref","ref":"com.atproto.server.defs#inviteCode"}},"invitesDisabled":{"type":"boolean"},"inviteNote":{"type":"string"},"emailConfirmedAt":{"type":"string","format":"datetime"},"deactivatedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRepoViewDetail class >> fromRequest: aRequest [
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
				ifPresent: [ :aValue | ToolsOzoneModerationDefsModerationDetail fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpInvitedBy: (aRequest
				at: 'invitedBy'
				ifPresent: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpInvites: (aRequest
				at: 'invites'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoServerDefsInviteCode fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpInvitesDisabled: (aRequest at: 'invitesDisabled' ifAbsent: [ nil ]);
		atpInviteNote: (aRequest at: 'inviteNote' ifAbsent: [ nil ]);
		atpEmailConfirmedAt: (aRequest at: 'emailConfirmedAt' ifAbsent: [ nil ]);
		atpDeactivatedAt: (aRequest at: 'deactivatedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpDeactivatedAt [
	<atpType:#String format:'datetime'>
	^ atpDeactivatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpDeactivatedAt: anObject [
	atpDeactivatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpEmail [
	<atpType:#String format:nil>
	^ atpEmail
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpEmailConfirmedAt [
	<atpType:#String format:'datetime'>
	^ atpEmailConfirmedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpEmailConfirmedAt: anObject [
	atpEmailConfirmedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInviteNote [
	<atpType:#String format:nil>
	^ atpInviteNote
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInviteNote: anObject [
	atpInviteNote := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvitedBy [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	^ atpInvitedBy
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvitedBy: anObject [
	<referenceTo:'com.atproto.server.defs#inviteCode'>
	atpInvitedBy := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvites [
	<atpType:#ComAtprotoServerDefsInviteCode format:nil>
	<atpCollection>
	^ atpInvites
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvites: anObject [
	atpInvites := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvitesDisabled [
	<atpType:#Boolean format:nil>
	^ atpInvitesDisabled
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpInvitesDisabled: anObject [
	atpInvitesDisabled := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpModeration [
	<referenceTo:'#moderationDetail'>
	<atpType:#ToolsOzoneModerationDefsModerationDetail format:nil>
	^ atpModeration
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atpModeration := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpRelatedRecords [
	<atpType:#Object format:nil>
	<atpCollection>
	^ atpRelatedRecords
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewDetail >> atpRelatedRecords: anObject [
	atpRelatedRecords := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> deactivatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeactivatedAt';
		accessor: #atpDeactivatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> emailConfirmedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'EmailConfirmedAt';
		accessor: #atpEmailConfirmedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> inviteNoteDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'InviteNote';
		accessor: #atpInviteNote
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> invitedByDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'InvitedBy';
		accessor: #atpInvitedBy
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> invitesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoServerDefsInviteCode};
		label: 'Invites';
		accessor: #atpInvites
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> invitesDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'InvitesDisabled';
		accessor: #atpInvitesDisabled
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewDetail >> relatedRecordsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Object};
		label: 'RelatedRecords';
		accessor: #atpRelatedRecords;
		beRequired
]
