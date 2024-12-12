Class {
	#name : #ToolsOzoneModerationDefsModEventAcknowledge,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpAcknowledgeAccountSubjects'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventAcknowledge'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge class >> atpSchema [
 ^ '{"type":"object","properties":{"comment":{"type":"string"},"acknowledgeAccountSubjects":{"type":"boolean","description":"If true, all other reports on content authored by this account will be resolved (acknowledged)."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventAcknowledge class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpAcknowledgeAccountSubjects: (aRequest at: 'acknowledgeAccountSubjects' ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventAcknowledge >> acknowledgeAccountSubjectsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'AcknowledgeAccountSubjects';
		accessor: #atpAcknowledgeAccountSubjects
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpAcknowledgeAccountSubjects [
	<atpType:#Boolean format:nil>
	^ atpAcknowledgeAccountSubjects
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpAcknowledgeAccountSubjects: anObject [
	atpAcknowledgeAccountSubjects := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventAcknowledge >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventAcknowledge >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]
