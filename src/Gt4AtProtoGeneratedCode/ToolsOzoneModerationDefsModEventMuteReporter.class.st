Class {
	#name : #ToolsOzoneModerationDefsModEventMuteReporter,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpDurationInHours'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter class >> atpDescription [
 ^  'Mute incoming reports from an account'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventMuteReporter'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter class >> atpSchema [
 ^ '{"type":"object","description":"Mute incoming reports from an account","required":["durationInHours"],"properties":{"comment":{"type":"string"},"durationInHours":{"type":"integer","description":"Indicates how long the account should remain muted."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventMuteReporter class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpDurationInHours: (aRequest at: 'durationInHours' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter >> atpDurationInHours [
	<atpType:#Number format:nil>
	^ atpDurationInHours
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventMuteReporter >> atpDurationInHours: anObject [
	atpDurationInHours := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventMuteReporter >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventMuteReporter >> durationInHoursDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'DurationInHours';
		accessor: #atpDurationInHours;
		beRequired
]
