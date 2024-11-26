Class {
	#name : #ToolsOzoneModerationDefsModEventEmail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubjectLine',
		'atpContent',
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail class >> atpDescription [
 ^  'Keep a log of outgoing email to a user'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventEmail'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail class >> atpSchema [
 ^ '{"type":"object","description":"Keep a log of outgoing email to a user","required":["subjectLine"],"properties":{"subjectLine":{"type":"string","description":"The subject line of the email sent to the user."},"content":{"type":"string","description":"The content of the email sent to the user."},"comment":{"type":"string","description":"Additional comment about the outgoing comm."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventEmail class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSubjectLine: (aRequest at: 'subjectLine' ifAbsent: [ nil ]);
		atpContent: (aRequest at: 'content' ifAbsent: [ nil ]);
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpContent [
	<atpType:#String format:nil>
	^ atpContent
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpContent: anObject [
	atpContent := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpSubjectLine [
	<atpType:#String format:nil>
	^ atpSubjectLine
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventEmail >> atpSubjectLine: anObject [
	atpSubjectLine := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventEmail >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventEmail >> contentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Content';
		accessor: #atpContent
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventEmail >> subjectLineDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SubjectLine';
		accessor: #atpSubjectLine;
		beRequired
]
