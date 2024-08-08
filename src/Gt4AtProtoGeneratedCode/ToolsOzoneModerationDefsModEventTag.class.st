Class {
	#name : #ToolsOzoneModerationDefsModEventTag,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAdd',
		'atpRemove',
		'atpComment'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag class >> atpDescription [
 ^  'Add/Remove a tag on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventTag'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag class >> atpSchema [
 ^ '{"type":"object","description":"Add/Remove a tag on a subject","required":["add","remove"],"properties":{"add":{"type":"array","items":{"type":"string"},"description":"Tags to be added to the subject. If already exists, won''t be duplicated."},"remove":{"type":"array","items":{"type":"string"},"description":"Tags to be removed to the subject. Ignores a tag If it doesn''t exist, won''t be duplicated."},"comment":{"type":"string","description":"Additional comment about added/removed tags."}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventTag class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpAdd: (aRequest
				at: 'add'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpRemove: (aRequest
				at: 'remove'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTag >> addDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Add';
		accessor: #atpAdd;
		beRequired
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpAdd [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpAdd
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpAdd: anObject [
	atpAdd := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpRemove [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpRemove
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventTag >> atpRemove: anObject [
	atpRemove := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTag >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventTag >> removeDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Remove';
		accessor: #atpRemove;
		beRequired
]
