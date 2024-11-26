Class {
	#name : #ToolsOzoneModerationDefsModEventResolveAppeal,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal class >> atpDescription [
 ^  'Resolve appeal on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventResolveAppeal'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal class >> atpSchema [
 ^ '{"type":"object","description":"Resolve appeal on a subject","properties":{"comment":{"type":"string","description":"Describe resolution."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventResolveAppeal class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventResolveAppeal >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventResolveAppeal >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
