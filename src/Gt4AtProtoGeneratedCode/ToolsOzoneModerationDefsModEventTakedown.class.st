Class {
	#name : #ToolsOzoneModerationDefsModEventTakedown,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpDurationInHours',
		'atpAcknowledgeAccountSubjects'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown class >> atpDescription [
 ^  'Take down a subject permanently or temporarily'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventTakedown'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown class >> atpSchema [
 ^ '{"type":"object","description":"Take down a subject permanently or temporarily","properties":{"comment":{"type":"string"},"durationInHours":{"type":"integer","description":"Indicates how long the takedown should be in effect before automatically expiring."},"acknowledgeAccountSubjects":{"type":"boolean","description":"If true, all other reports on content authored by this account will be resolved (acknowledged)."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventTakedown class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpDurationInHours: (aRequest at: 'durationInHours' ifAbsent: [ nil ]);
		atpAcknowledgeAccountSubjects: (aRequest at: 'acknowledgeAccountSubjects' ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTakedown >> acknowledgeAccountSubjectsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'AcknowledgeAccountSubjects';
		accessor: #atpAcknowledgeAccountSubjects
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpAcknowledgeAccountSubjects [
	<atpType:#Boolean format:nil>
	^ atpAcknowledgeAccountSubjects
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpAcknowledgeAccountSubjects: anObject [
	atpAcknowledgeAccountSubjects := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpDurationInHours [
	<atpType:#Number format:nil>
	^ atpDurationInHours
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTakedown >> atpDurationInHours: anObject [
	atpDurationInHours := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTakedown >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTakedown >> durationInHoursDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'DurationInHours';
		accessor: #atpDurationInHours
]
