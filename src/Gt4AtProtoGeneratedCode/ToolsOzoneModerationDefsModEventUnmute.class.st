Class {
	#name : #ToolsOzoneModerationDefsModEventUnmute,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute class >> atpDescription [
 ^  'Unmute action on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventUnmute'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute class >> atpSchema [
 ^ '{"type":"object","description":"Unmute action on a subject","properties":{"comment":{"type":"string","description":"Describe reasoning behind the reversal."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventUnmute class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventUnmute >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventUnmute >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
