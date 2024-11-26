Class {
	#name : #ToolsOzoneModerationDefsImageDetails,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpWidth',
		'atpHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#imageDetails'
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails class >> atpSchema [
 ^ '{"type":"object","required":["width","height"],"properties":{"width":{"type":"integer"},"height":{"type":"integer"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsImageDetails class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]);
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails >> atpHeight [
	<atpType:#Number format:nil>
	^ atpHeight
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails >> atpWidth [
	<atpType:#Number format:nil>
	^ atpWidth
]

{ #category : #accessing }
ToolsOzoneModerationDefsImageDetails >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsImageDetails >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsImageDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
		beRequired
]
