Class {
	#name : #ToolsOzoneModerationDefsModeration,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubjectStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModeration class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModeration class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModeration class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#moderation'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModeration class >> atpSchema [
 ^ '{"type":"object","properties":{"subjectStatus":{"type":"ref","ref":"#subjectStatusView"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModeration class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubjectStatus: (aRequest
				at: 'subjectStatus'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsSubjectStatusView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModeration >> atpSubjectStatus [
	<referenceTo:'#subjectStatusView'>
	<atpType:#ToolsOzoneModerationDefsSubjectStatusView format:nil>
	^ atpSubjectStatus
]

{ #category : #accessing }
ToolsOzoneModerationDefsModeration >> atpSubjectStatus: anObject [
	<referenceTo:'#subjectStatusView'>
	atpSubjectStatus := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModeration >> subjectStatusDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'SubjectStatus';
		accessor: #atpSubjectStatus
]
