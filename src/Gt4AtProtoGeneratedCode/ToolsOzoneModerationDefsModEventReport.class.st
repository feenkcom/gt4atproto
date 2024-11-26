Class {
	#name : #ToolsOzoneModerationDefsModEventReport,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpIsReporterMuted',
		'atpReportType'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport class >> atpDescription [
 ^  'Report a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventReport'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport class >> atpSchema [
 ^ '{"type":"object","description":"Report a subject","required":["reportType"],"properties":{"comment":{"type":"string"},"isReporterMuted":{"type":"boolean","description":"Set to true if the reporter was muted from reporting at the time of the event. These reports won''t impact the reviewState of the subject."},"reportType":{"type":"ref","ref":"com.atproto.moderation.defs#reasonType"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventReport class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpIsReporterMuted: (aRequest at: 'isReporterMuted' ifAbsent: [ nil ]);
		atpReportType: (aRequest at: 'reportType' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpIsReporterMuted [
	<atpType:#Boolean format:nil>
	^ atpIsReporterMuted
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpIsReporterMuted: anObject [
	atpIsReporterMuted := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpReportType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	<atpType:#String format:nil>
	^ atpReportType
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventReport >> atpReportType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atpReportType := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventReport >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventReport >> isReporterMutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'IsReporterMuted';
		accessor: #atpIsReporterMuted
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventReport >> reportTypeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReportType';
		accessor: #atpReportType;
		beRequired
]
