Class {
	#name : #ToolsOzoneModerationDefsIdentityEvent,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpHandle',
		'atpPdsHost',
		'atpTombstone',
		'atpTimestamp'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent class >> atpDescription [
 ^  'Logs identity related events on a repo subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.'
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#identityEvent'
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent class >> atpSchema [
 ^ '{"type":"object","description":"Logs identity related events on a repo subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.","required":["timestamp"],"properties":{"comment":{"type":"string"},"handle":{"type":"string","format":"handle"},"pdsHost":{"type":"string","format":"uri"},"tombstone":{"type":"boolean"},"timestamp":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsIdentityEvent class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpPdsHost: (aRequest at: 'pdsHost' ifAbsent: [ nil ]);
		atpTombstone: (aRequest at: 'tombstone' ifAbsent: [ nil ]);
		atpTimestamp: (aRequest at: 'timestamp' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpPdsHost [
	<atpType:#String format:'uri'>
	^ atpPdsHost
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpPdsHost: anObject [
	atpPdsHost := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpTimestamp [
	<atpType:#String format:'datetime'>
	^ atpTimestamp
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpTimestamp: anObject [
	atpTimestamp := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpTombstone [
	<atpType:#Boolean format:nil>
	^ atpTombstone
]

{ #category : #accessing }
ToolsOzoneModerationDefsIdentityEvent >> atpTombstone: anObject [
	atpTombstone := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsIdentityEvent >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsIdentityEvent >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle
]

{ #category : #magritte }
ToolsOzoneModerationDefsIdentityEvent >> pdsHostDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'PdsHost';
		accessor: #atpPdsHost
]

{ #category : #magritte }
ToolsOzoneModerationDefsIdentityEvent >> timestampDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Timestamp';
		accessor: #atpTimestamp;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsIdentityEvent >> tombstoneDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Tombstone';
		accessor: #atpTombstone
]
