Class {
	#name : #ToolsOzoneModerationDefsAccountEvent,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpActive',
		'atpStatus',
		'atpTimestamp'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent class >> atpDescription [
 ^  'Logs account status related events on a repo subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.'
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#accountEvent'
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent class >> atpSchema [
 ^ '{"type":"object","description":"Logs account status related events on a repo subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.","required":["timestamp","active"],"properties":{"comment":{"type":"string"},"active":{"type":"boolean","description":"Indicates that the account has a repository which can be fetched from the host that emitted this event."},"status":{"type":"string","knownValues":["unknown","deactivated","deleted","takendown","suspended","tombstoned"]},"timestamp":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsAccountEvent class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpActive: (aRequest at: 'active' ifAbsent: [ nil ]);
		atpStatus: (aRequest at: 'status' ifAbsent: [ nil ]);
		atpTimestamp: (aRequest at: 'timestamp' ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountEvent >> activeDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Active';
		accessor: #atpActive;
		beRequired
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpActive [
	<atpType:#Boolean format:nil>
	^ atpActive
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpActive: anObject [
	atpActive := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpStatus [
	<atpType:#String format:nil>
	^ atpStatus
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpStatus: anObject [
	atpStatus := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpTimestamp [
	<atpType:#String format:'datetime'>
	^ atpTimestamp
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountEvent >> atpTimestamp: anObject [
	atpTimestamp := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountEvent >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountEvent >> statusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Status';
		accessor: #atpStatus
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountEvent >> timestampDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Timestamp';
		accessor: #atpTimestamp;
		beRequired
]
