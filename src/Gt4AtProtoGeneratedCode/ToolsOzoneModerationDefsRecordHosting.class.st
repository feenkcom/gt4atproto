Class {
	#name : #ToolsOzoneModerationDefsRecordHosting,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpStatus',
		'atpUpdatedAt',
		'atpCreatedAt',
		'atpDeletedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#recordHosting'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting class >> atpSchema [
 ^ '{"type":"object","required":["status"],"properties":{"status":{"type":"string","knownValues":["deleted","unknown"]},"updatedAt":{"type":"string","format":"datetime"},"createdAt":{"type":"string","format":"datetime"},"deletedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRecordHosting class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpStatus: (aRequest at: 'status' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpDeletedAt: (aRequest at: 'deletedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpDeletedAt [
	<atpType:#String format:'datetime'>
	^ atpDeletedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpDeletedAt: anObject [
	atpDeletedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpStatus [
	<atpType:#String format:nil>
	^ atpStatus
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpStatus: anObject [
	atpStatus := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordHosting >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordHosting >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordHosting >> deletedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeletedAt';
		accessor: #atpDeletedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordHosting >> statusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Status';
		accessor: #atpStatus;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordHosting >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt
]
