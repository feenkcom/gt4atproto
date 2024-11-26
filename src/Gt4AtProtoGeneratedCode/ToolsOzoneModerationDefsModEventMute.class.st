Class {
	#name : #ToolsOzoneModerationDefsModEventMute,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpDurationInHours'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute class >> atpDescription [
 ^  'Mute incoming reports on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventMute'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute class >> atpSchema [
 ^ '{"type":"object","description":"Mute incoming reports on a subject","required":["durationInHours"],"properties":{"comment":{"type":"string"},"durationInHours":{"type":"integer","description":"Indicates how long the subject should remain muted."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventMute class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpDurationInHours: (aRequest at: 'durationInHours' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute >> atpDurationInHours [
	<atpType:#Number format:nil>
	^ atpDurationInHours
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMute >> atpDurationInHours: anObject [
	atpDurationInHours := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventMute >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventMute >> durationInHoursDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'DurationInHours';
		accessor: #atpDurationInHours;
		beRequired
]
