Class {
	#name : #ComAtprotoAdminDefsRecordViewDetail,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoValue',
		'atProtoBlobs',
		'atProtoLabels',
		'atProtoIndexedAt',
		'atProtoModeration',
		'atProtoRepo'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRecordViewDetail class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ]); 
		atProtoBlobs: (aRequest at: 'blobs' ifAbsent: [ nil ]); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atProtoModeration: (aRequest at: 'moderation' ifPresent: [:aValue | ComAtprotoAdminDefsModerationDetail fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoRepo: (aRequest at: 'repo' ifPresent: [:aValue | ComAtprotoAdminDefsRepoView fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoBlobs [
	^ atProtoBlobs
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoBlobs: anObject [
	atProtoBlobs := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoModeration [
	<referenceTo:'#moderationDetail'>
	^ atProtoModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoModeration: anObject [
	<referenceTo:'#moderationDetail'>
	atProtoModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoRepo [
	<referenceTo:'#repoView'>
	^ atProtoRepo
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoRepo: anObject [
	<referenceTo:'#repoView'>
	atProtoRepo := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewDetail >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> blobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsBlobView};
		label: 'Blobs';
		accessor: #atProtoBlobs;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atProtoModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atProtoRepo;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewDetail >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
