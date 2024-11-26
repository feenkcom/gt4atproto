Class {
	#name : #ToolsOzoneModerationDefsModEventUnmuteReporter,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter class >> atpDescription [
 ^  'Unmute incoming reports from an account'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventUnmuteReporter'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter class >> atpSchema [
 ^ '{"type":"object","description":"Unmute incoming reports from an account","properties":{"comment":{"type":"string","description":"Describe reasoning behind the reversal."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventUnmuteReporter class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmuteReporter >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventUnmuteReporter >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
