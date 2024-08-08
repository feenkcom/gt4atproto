Class {
	#name : #ToolsOzoneModerationDefsRepoViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#repoViewNotFound'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRepoViewNotFound class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRepoViewNotFound >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRepoViewNotFound >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]
