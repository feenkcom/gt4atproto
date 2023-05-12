Class {
	#name : #ComAtprotoAdminDefsRecordViewDetail,
	#superclass : #Object,
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

{ #category : #serialization }
ComAtprotoAdminDefsRecordViewDetail class >> fromRequest: aRequest [
	^ self new atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ]); 
		atpBlobs: (aRequest at: 'blobs' ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atpModeration: (aRequest at: 'moderation' ifPresent: [:aValue | ComAtprotoAdminDefsModerationDetail fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpRepo: (aRequest at: 'repo' ifPresent: [:aValue | ComAtprotoAdminDefsRepoView fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpBlobs [
	^ atpBlobs
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpBlobs: anObject [
	atpBlobs := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpModeration [
	<referenceTo:'#moderationDetail'>
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
	^ atpRepo
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpRepo: anObject [
	<referenceTo:'#repoView'>
	atpRepo := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpUri [
	^ atpUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atpValue [
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