Class {
	#name : #ToolsOzoneModerationDefsRecordViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#recordViewNotFound'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRecordViewNotFound class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewNotFound >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewNotFound >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
