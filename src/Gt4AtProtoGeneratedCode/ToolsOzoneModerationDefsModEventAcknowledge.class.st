Class {
	#name : #ToolsOzoneModerationDefsModEventAcknowledge,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventAcknowledge'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpSchema [
 ^ '{"type":"object","properties":{"comment":{"type":"string"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventAcknowledge class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventAcknowledge >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
