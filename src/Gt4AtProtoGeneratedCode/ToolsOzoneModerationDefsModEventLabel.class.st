Class {
	#name : #ToolsOzoneModerationDefsModEventLabel,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpComment',
		'atpCreateLabelVals',
		'atpNegateLabelVals'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel class >> atpDescription [
 ^  'Apply/Negate labels on a subject'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventLabel'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel class >> atpSchema [
 ^ '{"type":"object","description":"Apply/Negate labels on a subject","required":["createLabelVals","negateLabelVals"],"properties":{"comment":{"type":"string"},"createLabelVals":{"type":"array","items":{"type":"string"}},"negateLabelVals":{"type":"array","items":{"type":"string"}}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventLabel class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpCreateLabelVals: (aRequest
				at: 'createLabelVals'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpNegateLabelVals: (aRequest
				at: 'negateLabelVals'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpCreateLabelVals [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpCreateLabelVals
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpCreateLabelVals: anObject [
	atpCreateLabelVals := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpNegateLabelVals [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpNegateLabelVals
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventLabel >> atpNegateLabelVals: anObject [
	atpNegateLabelVals := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventLabel >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventLabel >> createLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'CreateLabelVals';
		accessor: #atpCreateLabelVals;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventLabel >> negateLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'NegateLabelVals';
		accessor: #atpNegateLabelVals;
		beRequired
]
