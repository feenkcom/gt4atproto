Class {
	#name : #ToolsOzoneModerationDefsModEventDivert,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert class >> atpDescription [
 ^  'Divert a record''s blobs to a 3rd party service for further scanning/tagging'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventDivert'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert class >> atpSchema [
 ^ '{"type":"object","description":"Divert a record''s blobs to a 3rd party service for further scanning/tagging","properties":{"comment":{"type":"string"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventDivert class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventDivert >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventDivert >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
