Class {
	#name : #ToolsOzoneModerationDefsModEventComment,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpSticky'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment class >> atpDescription [
 ^  'Add a comment to a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventComment'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment class >> atpSchema [
 ^ '{"type":"object","description":"Add a comment to a subject","required":["comment"],"properties":{"comment":{"type":"string"},"sticky":{"type":"boolean","description":"Make the comment persistent on the subject"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventComment class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpSticky: (aRequest at: 'sticky' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment >> atpSticky [
	<atpType:#Boolean format:nil>
	^ atpSticky
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventComment >> atpSticky: anObject [
	atpSticky := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventComment >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventComment >> stickyDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Sticky';
		accessor: #atpSticky
]
