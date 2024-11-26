Class {
	#name : #ToolsOzoneModerationDefsModEventEscalate,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventEscalate'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate class >> atpSchema [
 ^ '{"type":"object","properties":{"comment":{"type":"string"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventEscalate class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEscalate >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventEscalate >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
