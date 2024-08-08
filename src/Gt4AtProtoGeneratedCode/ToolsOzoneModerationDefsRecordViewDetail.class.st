Class {
	#name : #ToolsOzoneModerationDefsRecordViewDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValue',
		'atpBlobs',
		'atpLabels',
		'atpIndexedAt',
		'atpModeration',
		'atpRepo'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#recordViewDetail'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","value","blobs","indexedAt","moderation","repo"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"value":{"type":"unknown"},"blobs":{"type":"array","items":{"type":"ref","ref":"#blobView"}},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderationDetail"},"repo":{"type":"ref","ref":"#repoView"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRecordViewDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpValue: (aRequest
				at: 'value'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue ]
				ifAbsent: [ nil ]);
		atpBlobs: (aRequest
				at: 'blobs'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ToolsOzoneModerationDefsBlobView fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpModeration: (aRequest
				at: 'moderation'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsModerationDetail fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpRepo: (aRequest
				at: 'repo'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsRepoView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpBlobs [
	<atpType:#ToolsOzoneModerationDefsBlobView format:nil>
	<atpCollection>
	^ atpBlobs
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpBlobs: anObject [
	atpBlobs := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpModeration [
	<referenceTo:'#moderationDetail'>
	<atpType:#ToolsOzoneModerationDefsModerationDetail format:nil>
	^ atpModeration
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atpModeration := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpRepo [
	<referenceTo:'#repoView'>
	<atpType:#ToolsOzoneModerationDefsRepoView format:nil>
	^ atpRepo
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpRepo: anObject [
	<referenceTo:'#repoView'>
	atpRepo := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordViewDetail >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> blobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ToolsOzoneModerationDefsBlobView};
		label: 'Blobs';
		accessor: #atpBlobs;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atpRepo;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordViewDetail >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
