Class {
	#name : #ToolsOzoneModerationDefsModEventReverseTakedown,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown class >> atpDescription [
 ^  'Revert take down action on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventReverseTakedown'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown class >> atpSchema [
 ^ '{"type":"object","description":"Revert take down action on a subject","properties":{"comment":{"type":"string","description":"Describe reasoning behind the reversal."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventReverseTakedown class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReverseTakedown >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventReverseTakedown >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
