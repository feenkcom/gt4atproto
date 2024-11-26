Class {
	#name : #ToolsOzoneSettingDefsOption,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpKey',
		'atpDid',
		'atpValue',
		'atpDescription',
		'atpCreatedAt',
		'atpUpdatedAt',
		'atpManagerRole',
		'atpScope',
		'atpCreatedBy',
		'atpLastUpdatedBy'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneSettingDefsOption class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption class >> atpFile [
 ^ 'tools/ozone/setting/defs.json'
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption class >> atpRecordName [
 ^ 'tools.ozone.setting.defs#option'
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption class >> atpSchema [
 ^ '{"type":"object","required":["key","value","did","scope","createdBy","lastUpdatedBy"],"properties":{"key":{"type":"string","format":"nsid"},"did":{"type":"string","format":"did"},"value":{"type":"unknown"},"description":{"type":"string","maxGraphemes":1024,"maxLength":10240},"createdAt":{"type":"string","format":"datetime"},"updatedAt":{"type":"string","format":"datetime"},"managerRole":{"type":"string","knownValues":["tools.ozone.team.defs#roleModerator","tools.ozone.team.defs#roleTriage","tools.ozone.team.defs#roleAdmin"]},"scope":{"type":"string","knownValues":["instance","personal"]},"createdBy":{"type":"string","format":"did"},"lastUpdatedBy":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
ToolsOzoneSettingDefsOption class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpKey: (aRequest at: 'key' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpValue: (aRequest
				at: 'value'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ]);
		atpManagerRole: (aRequest at: 'managerRole' ifAbsent: [ nil ]);
		atpScope: (aRequest at: 'scope' ifAbsent: [ nil ]);
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]);
		atpLastUpdatedBy: (aRequest at: 'lastUpdatedBy' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpCreatedBy [
	<atpType:#String format:'did'>
	^ atpCreatedBy
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpKey [
	<atpType:#String format:'nsid'>
	^ atpKey
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpKey: anObject [
	atpKey := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpLastUpdatedBy [
	<atpType:#String format:'did'>
	^ atpLastUpdatedBy
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpLastUpdatedBy: anObject [
	atpLastUpdatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpManagerRole [
	<atpType:#String format:nil>
	^ atpManagerRole
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpManagerRole: anObject [
	atpManagerRole := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpScope [
	<atpType:#String format:nil>
	^ atpScope
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpScope: anObject [
	atpScope := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ToolsOzoneSettingDefsOption >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> keyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Key';
		accessor: #atpKey;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> lastUpdatedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastUpdatedBy';
		accessor: #atpLastUpdatedBy;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> managerRoleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ManagerRole';
		accessor: #atpManagerRole
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> scopeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Scope';
		accessor: #atpScope;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt
]

{ #category : #magritte }
ToolsOzoneSettingDefsOption >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
