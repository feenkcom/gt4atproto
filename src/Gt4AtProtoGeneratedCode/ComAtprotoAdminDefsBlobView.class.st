Class {
	#name : #ComAtprotoAdminDefsBlobView,
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
ComAtprotoAdminDefsBlobView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#blobView'
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView class >> atpSchema [
 ^ '{"type":"object","required":["cid","mimeType","size","createdAt"],"properties":{"cid":{"type":"string","format":"cid"},"mimeType":{"type":"string"},"size":{"type":"integer"},"createdAt":{"type":"string","format":"datetime"},"details":{"type":"union","refs":["#imageDetails","#videoDetails"]},"moderation":{"type":"ref","ref":"#moderation"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsBlobView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpMimeType: (aRequest at: 'mimeType' ifAbsent: [ nil ]); 
		atpSize: (aRequest at: 'size' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpDetails: (aRequest at: 'details' ifPresent: [:aValue | ({'com.atproto.admin.defs#imageDetails' -> ComAtprotoAdminDefsImageDetails. 'com.atproto.admin.defs#videoDetails' -> ComAtprotoAdminDefsVideoDetails} asDictionary at: (aValue at: '$type')) fromRequest: aValue] ifAbsent: [ nil ]); 
		atpModeration: (aRequest at: 'moderation' ifPresent: [:aValue | ComAtprotoAdminDefsModeration fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpDetails [
	^ atpDetails
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpDetails: anObject [
	atpDetails := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpMimeType [
	^ atpMimeType
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpMimeType: anObject [
	atpMimeType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpModeration [
	<referenceTo:'#moderation'>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpSize [
	^ atpSize
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atpSize: anObject [
	atpSize := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> detailsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#imageDetails'. '#videoDetails'};
		label: 'Details';
		accessor: #atpDetails
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> mimeTypeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MimeType';
		accessor: #atpMimeType;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> sizeDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Size';
		accessor: #atpSize;
	beRequired
]
