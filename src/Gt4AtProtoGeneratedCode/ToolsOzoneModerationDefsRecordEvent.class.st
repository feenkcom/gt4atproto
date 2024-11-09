Class {
	#name : #ToolsOzoneModerationDefsRecordEvent,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpOp',
		'atpCid',
		'atpTimestamp'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent class >> atpDescription [
 ^  'Logs lifecycle event on a record subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#recordEvent'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent class >> atpSchema [
 ^ '{"type":"object","description":"Logs lifecycle event on a record subject. Normally captured by automod from the firehose and emitted to ozone for historical tracking.","required":["timestamp","op"],"properties":{"comment":{"type":"string"},"op":{"type":"string","knownValues":["create","update","delete"]},"cid":{"type":"string","format":"cid"},"timestamp":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRecordEvent class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpOp: (aRequest at: 'op' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpTimestamp: (aRequest at: 'timestamp' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpOp [
	<atpType:#String format:nil>
	^ atpOp
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpOp: anObject [
	atpOp := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpTimestamp [
	<atpType:#String format:'datetime'>
	^ atpTimestamp
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordEvent >> atpTimestamp: anObject [
	atpTimestamp := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordEvent >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordEvent >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordEvent >> opDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Op';
		accessor: #atpOp;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordEvent >> timestampDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Timestamp';
		accessor: #atpTimestamp;
		beRequired
]
