Class {
	#name : #ComAtprotoAdminDefsRecordViewDetail,
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
ComAtprotoAdminDefsRecordViewDetail class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#recordViewDetail'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","value","blobs","indexedAt","moderation","repo"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"value":{"type":"unknown"},"blobs":{"type":"array","items":{"type":"ref","ref":"#blobView"}},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderationDetail"},"repo":{"type":"ref","ref":"#repoView"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRecordViewDetail class >> fromRequest: aRequest [
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
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoAdminDefsBlobView fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpModeration: (aRequest
				at: 'moderation'
				ifPresent: [ :aValue | ComAtprotoAdminDefsModerationDetail fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpRepo: (aRequest
				at: 'repo'
				ifPresent: [ :aValue | ComAtprotoAdminDefsRepoView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpBlobs [
	<atpType:#ComAtprotoAdminDefsBlobView format:nil>
	<atpCollection>
	^ atpBlobs
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpBlobs: anObject [
	atpBlobs := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpModeration [
	<referenceTo:'#moderationDetail'>
	<atpType:#ComAtprotoAdminDefsModerationDetail format:nil>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpRepo [
	<referenceTo:'#repoView'>
	<atpType:#ComAtprotoAdminDefsRepoView format:nil>
	^ atpRepo
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpRepo: anObject [
	<referenceTo:'#repoView'>
	atpRepo := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> blobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsBlobView};
		label: 'Blobs';
		accessor: #atpBlobs;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atpRepo;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
