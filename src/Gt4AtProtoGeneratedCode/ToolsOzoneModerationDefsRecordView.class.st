Class {
	#name : #ToolsOzoneModerationDefsRecordView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValue',
		'atpBlobCids',
		'atpIndexedAt',
		'atpModeration',
		'atpRepo'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#recordView'
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","value","blobCids","indexedAt","moderation","repo"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"value":{"type":"unknown"},"blobCids":{"type":"array","items":{"type":"string","format":"cid"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderation"},"repo":{"type":"ref","ref":"#repoView"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsRecordView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpValue: (aRequest
				at: 'value'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue ]
				ifAbsent: [ nil ]);
		atpBlobCids: (aRequest
				at: 'blobCids'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpModeration: (aRequest
				at: 'moderation'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsModeration fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpRepo: (aRequest
				at: 'repo'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsRepoView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpBlobCids [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpBlobCids
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpBlobCids: anObject [
	atpBlobCids := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpModeration [
	<referenceTo:'#moderation'>
	<atpType:#ToolsOzoneModerationDefsModeration format:nil>
	^ atpModeration
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpRepo [
	<referenceTo:'#repoView'>
	<atpType:#ToolsOzoneModerationDefsRepoView format:nil>
	^ atpRepo
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpRepo: anObject [
	<referenceTo:'#repoView'>
	atpRepo := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ToolsOzoneModerationDefsRecordView >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> blobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'BlobCids';
		accessor: #atpBlobCids;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atpRepo;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsRecordView >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
