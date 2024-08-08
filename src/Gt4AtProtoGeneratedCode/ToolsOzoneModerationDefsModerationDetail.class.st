Class {
	#name : #ToolsOzoneModerationDefsModerationDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubjectStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#moderationDetail'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail class >> atpSchema [
 ^ '{"type":"object","properties":{"subjectStatus":{"type":"ref","ref":"#subjectStatusView"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModerationDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubjectStatus: (aRequest
				at: 'subjectStatus'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsSubjectStatusView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail >> atpSubjectStatus [
	<referenceTo:'#subjectStatusView'>
	<atpType:#ToolsOzoneModerationDefsSubjectStatusView format:nil>
	^ atpSubjectStatus
]

{ #category : #accessing }
ToolsOzoneModerationDefsModerationDetail >> atpSubjectStatus: anObject [
	<referenceTo:'#subjectStatusView'>
	atpSubjectStatus := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModerationDetail >> subjectStatusDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'SubjectStatus';
		accessor: #atpSubjectStatus
]
