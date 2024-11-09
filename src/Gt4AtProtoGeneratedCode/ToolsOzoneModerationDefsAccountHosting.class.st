Class {
	#name : #ToolsOzoneModerationDefsAccountHosting,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpStatus',
		'atpUpdatedAt',
		'atpCreatedAt',
		'atpDeletedAt',
		'atpDeactivatedAt',
		'atpReactivatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#accountHosting'
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting class >> atpSchema [
 ^ '{"type":"object","required":["status"],"properties":{"status":{"type":"string","knownValues":["takendown","suspended","deleted","deactivated","unknown"]},"updatedAt":{"type":"string","format":"datetime"},"createdAt":{"type":"string","format":"datetime"},"deletedAt":{"type":"string","format":"datetime"},"deactivatedAt":{"type":"string","format":"datetime"},"reactivatedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsAccountHosting class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpStatus: (aRequest at: 'status' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpDeletedAt: (aRequest at: 'deletedAt' ifAbsent: [ nil ]);
		atpDeactivatedAt: (aRequest at: 'deactivatedAt' ifAbsent: [ nil ]);
		atpReactivatedAt: (aRequest at: 'reactivatedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpDeactivatedAt [
	<atpType:#String format:'datetime'>
	^ atpDeactivatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpDeactivatedAt: anObject [
	atpDeactivatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpDeletedAt [
	<atpType:#String format:'datetime'>
	^ atpDeletedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpDeletedAt: anObject [
	atpDeletedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpReactivatedAt [
	<atpType:#String format:'datetime'>
	^ atpReactivatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpReactivatedAt: anObject [
	atpReactivatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpStatus [
	<atpType:#String format:nil>
	^ atpStatus
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpStatus: anObject [
	atpStatus := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsAccountHosting >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> deactivatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeactivatedAt';
		accessor: #atpDeactivatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> deletedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DeletedAt';
		accessor: #atpDeletedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> reactivatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReactivatedAt';
		accessor: #atpReactivatedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> statusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Status';
		accessor: #atpStatus;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsAccountHosting >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt
]
