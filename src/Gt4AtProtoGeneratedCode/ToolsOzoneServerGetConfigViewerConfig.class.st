Class {
	#name : #ToolsOzoneServerGetConfigViewerConfig,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRole'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig class >> atpFile [
 ^ 'tools/ozone/server/getConfig.json'
]

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig class >> atpRecordName [
 ^ 'tools.ozone.server.getConfig#viewerConfig'
]

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig class >> atpSchema [
 ^ '{"type":"object","properties":{"role":{"type":"string","knownValues":["tools.ozone.team.defs#roleAdmin","tools.ozone.team.defs#roleModerator","tools.ozone.team.defs#roleTriage"]}}}'
]

{ #category : #serialization }
ToolsOzoneServerGetConfigViewerConfig class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpRole: (aRequest at: 'role' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig >> atpRole [
	<atpType:#String format:nil>
	^ atpRole
]

{ #category : #accessing }
ToolsOzoneServerGetConfigViewerConfig >> atpRole: anObject [
	atpRole := anObject
]

{ #category : #magritte }
ToolsOzoneServerGetConfigViewerConfig >> roleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Role';
		accessor: #atpRole
]
