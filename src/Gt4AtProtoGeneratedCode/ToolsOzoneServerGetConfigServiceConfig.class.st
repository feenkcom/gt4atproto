Class {
	#name : #ToolsOzoneServerGetConfigServiceConfig,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUrl'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig class >> atpFile [
 ^ 'tools/ozone/server/getConfig.json'
]

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig class >> atpRecordName [
 ^ 'tools.ozone.server.getConfig#serviceConfig'
]

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig class >> atpSchema [
 ^ '{"type":"object","properties":{"url":{"type":"string","format":"uri"}}}'
]

{ #category : #serialization }
ToolsOzoneServerGetConfigServiceConfig class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUrl: (aRequest at: 'url' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig >> atpUrl [
	<atpType:#String format:'uri'>
	^ atpUrl
]

{ #category : #accessing }
ToolsOzoneServerGetConfigServiceConfig >> atpUrl: anObject [
	atpUrl := anObject
]

{ #category : #magritte }
ToolsOzoneServerGetConfigServiceConfig >> urlDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Url';
		accessor: #atpUrl
]
