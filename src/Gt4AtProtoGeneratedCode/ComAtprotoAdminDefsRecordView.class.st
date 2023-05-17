Class {
	#name : #ComAtprotoAdminDefsRecordView,
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
ComAtprotoAdminDefsRecordView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#recordView'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","value","blobCids","indexedAt","moderation","repo"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"value":{"type":"unknown"},"blobCids":{"type":"array","items":{"type":"string","format":"cid"}},"indexedAt":{"type":"string","format":"datetime"},"moderation":{"type":"ref","ref":"#moderation"},"repo":{"type":"ref","ref":"#repoView"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRecordView class >> fromRequest: aRequest [
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
				ifPresent: [ :aValue | ComAtprotoAdminDefsModeration fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpRepo: (aRequest
				at: 'repo'
				ifPresent: [ :aValue | ComAtprotoAdminDefsRepoView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpBlobCids [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpBlobCids
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpBlobCids: anObject [
	atpBlobCids := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpModeration [
	<referenceTo:'#moderation'>
	<atpType:#ComAtprotoAdminDefsModeration format:nil>
	^ atpModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpModeration: anObject [
	<referenceTo:'#moderation'>
	atpModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpRepo [
	<referenceTo:'#repoView'>
	<atpType:#ComAtprotoAdminDefsRepoView format:nil>
	^ atpRepo
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpRepo: anObject [
	<referenceTo:'#repoView'>
	atpRepo := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> blobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'BlobCids';
		accessor: #atpBlobCids;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atpModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atpRepo;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
