Class {
	#name : #ComAtprotoAdminDefsRecordView,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoValue',
		'atProtoBlobCids',
		'atProtoIndexedAt',
		'atProtoModeration',
		'atProtoRepo'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRecordView class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ]); 
		atProtoBlobCids: (aRequest at: 'blobCids' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atProtoModeration: (ComAtprotoAdminDefsModeration fromRequest: (aRequest at: 'moderation' ifAbsent: [ nil ])); 
		atProtoRepo: (ComAtprotoAdminDefsRepoView fromRequest: (aRequest at: 'repo' ifAbsent: [ nil ]))
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoBlobCids [
	^ atProtoBlobCids
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoBlobCids: anObject [
	atProtoBlobCids := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoModeration [
	<referenceTo:'#moderation'>
	^ atProtoModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoModeration: anObject [
	<referenceTo:'#moderation'>
	atProtoModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoRepo [
	<referenceTo:'#repoView'>
	^ atProtoRepo
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoRepo: anObject [
	<referenceTo:'#repoView'>
	atProtoRepo := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordView >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> blobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'BlobCids';
		accessor: #atProtoBlobCids;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atProtoModeration;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> repoDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Repo';
		accessor: #atProtoRepo;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordView >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
