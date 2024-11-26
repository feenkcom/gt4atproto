Class {
	#name : #ToolsOzoneTeamDefsMember,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpDisabled',
		'atpProfile',
		'atpCreatedAt',
		'atpUpdatedAt',
		'atpLastUpdatedBy',
		'atpRole'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneTeamDefsMember class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember class >> atpFile [
 ^ 'tools/ozone/team/defs.json'
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember class >> atpRecordName [
 ^ 'tools.ozone.team.defs#member'
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember class >> atpSchema [
 ^ '{"type":"object","required":["did","role"],"properties":{"did":{"type":"string","format":"did"},"disabled":{"type":"boolean"},"profile":{"type":"ref","ref":"app.bsky.actor.defs#profileViewDetailed"},"createdAt":{"type":"string","format":"datetime"},"updatedAt":{"type":"string","format":"datetime"},"lastUpdatedBy":{"type":"string"},"role":{"type":"string","knownValues":["#roleAdmin","#roleModerator","#roleTriage"]}}}'
]

{ #category : #serialization }
ToolsOzoneTeamDefsMember class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpDisabled: (aRequest at: 'disabled' ifAbsent: [ nil ]);
		atpProfile: (aRequest
				at: 'profile'
				ifPresent: [ :aValue | AppBskyActorDefsProfileViewDetailed fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ]);
		atpLastUpdatedBy: (aRequest at: 'lastUpdatedBy' ifAbsent: [ nil ]);
		atpRole: (aRequest at: 'role' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpDisabled [
	<atpType:#Boolean format:nil>
	^ atpDisabled
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpDisabled: anObject [
	atpDisabled := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpLastUpdatedBy [
	<atpType:#String format:nil>
	^ atpLastUpdatedBy
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpLastUpdatedBy: anObject [
	atpLastUpdatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpProfile [
	<referenceTo:'app.bsky.actor.defs#profileViewDetailed'>
	<atpType:#AppBskyActorDefsProfileViewDetailed format:nil>
	^ atpProfile
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpProfile: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewDetailed'>
	atpProfile := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpRole [
	<atpType:#String format:nil>
	^ atpRole
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpRole: anObject [
	atpRole := anObject
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneTeamDefsMember >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> disabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Disabled';
		accessor: #atpDisabled
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> lastUpdatedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastUpdatedBy';
		accessor: #atpLastUpdatedBy
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> profileDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Profile';
		accessor: #atpProfile
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> roleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Role';
		accessor: #atpRole;
		beRequired
]

{ #category : #magritte }
ToolsOzoneTeamDefsMember >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt
]
