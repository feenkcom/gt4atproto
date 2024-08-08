Class {
	#name : #ToolsOzoneModerationDefsVideoDetails,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpWidth',
		'atpHeight',
		'atpLength'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#videoDetails'
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails class >> atpSchema [
 ^ '{"type":"object","required":["width","height","length"],"properties":{"width":{"type":"integer"},"height":{"type":"integer"},"length":{"type":"integer"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsVideoDetails class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]);
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ]);
		atpLength: (aRequest at: 'length' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpHeight [
	<atpType:#Number format:nil>
	^ atpHeight
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpLength [
	<atpType:#Number format:nil>
	^ atpLength
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpLength: anObject [
	atpLength := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpWidth [
	<atpType:#Number format:nil>
	^ atpWidth
]

{ #category : #accessing }
ToolsOzoneModerationDefsVideoDetails >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsVideoDetails >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsVideoDetails >> lengthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Length';
		accessor: #atpLength;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsVideoDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
		beRequired
]
