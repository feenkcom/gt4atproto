Class {
	#name : #ToolsOzoneModerationDefsBlobView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCid',
		'atpMimeType',
		'atpSize',
		'atpCreatedAt',
		'atpDetails',
		'atpModeration'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#blobView'
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView class >> atpSchema [
 ^ '{"type":"object","required":["cid","mimeType","size","createdAt"],"properties":{"cid":{"type":"string","format":"cid"},"mimeType":{"type":"string"},"size":{"type":"integer"},"createdAt":{"type":"string","format":"datetime"},"details":{"type":"union","refs":["#imageDetails","#videoDetails"]},"moderation":{"type":"ref","ref":"#moderation"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsBlobView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpMimeType: (aRequest at: 'mimeType' ifAbsent: [ nil ]);
		atpSize: (aRequest at: 'size' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpDetails: (aRequest
				at: 'details'
				ifPresent: [ :aValue | 
					({'tools.ozone.moderation.defs#imageDetails'
							-> ToolsOzoneModerationDefsImageDetails.
						'tools.ozone.moderation.defs#videoDetails'
							-> ToolsOzoneModerationDefsVideoDetails} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpModeration: (aRequest
				at: 'moderation'
				ifPresent: [ :aValue | ToolsOzoneModerationDefsModeration fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpDetails [
	<atpType:#(ToolsOzoneModerationDefsImageDetails ToolsOzoneModerationDefsVideoDetails) format:nil>
	^ atpDetails
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpDetails: anObject [
	atpDetails := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpMimeType [
	<atpType:#String format:nil>
	^ atpMimeType
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpMimeType: anObject [
	atpMimeType := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpModeration [
	<referenceTo:'#moderation'>
	<atpType:#ToolsOzoneModerationDefsModeration format:nil>
	^ atpModeration
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpSize [
	<atpType:#Number format:nil>
	^ atpSize
]

{ #category : #accessing }
ToolsOzoneModerationDefsBlobView >> atpSize: anObject [
	atpSize := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> detailsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#imageDetails'.
				'#videoDetails'};
		label: 'Details';
		accessor: #atpDetails
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> mimeTypeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MimeType';
		accessor: #atpMimeType;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration
]

{ #category : #magritte }
ToolsOzoneModerationDefsBlobView >> sizeDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Size';
		accessor: #atpSize;
		beRequired
]
