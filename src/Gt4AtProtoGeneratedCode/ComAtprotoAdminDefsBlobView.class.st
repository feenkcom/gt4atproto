Class {
	#name : #ComAtprotoAdminDefsBlobView,
	#superclass : #Object,
	#instVars : [
		'atProtoCid',
		'atProtoMimeType',
		'atProtoSize',
		'atProtoCreatedAt',
		'atProtoDetails',
		'atProtoModeration'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsBlobView class >> fromRequest: aRequest [
	^ self new atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoMimeType: (aRequest at: 'mimeType' ifAbsent: [ nil ]); 
		atProtoSize: (aRequest at: 'size' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atProtoDetails: (aRequest at: 'details' ifAbsent: [ nil ]); 
		atProtoModeration: (ComAtprotoAdminDefsModeration fromRequest: (aRequest at: 'moderation' ifAbsent: [ nil ]))
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoDetails [
	^ atProtoDetails
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoDetails: anObject [
	atProtoDetails := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoMimeType [
	^ atProtoMimeType
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoMimeType: anObject [
	atProtoMimeType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoModeration [
	<referenceTo:'#moderation'>
	^ atProtoModeration
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoModeration: anObject [
	<referenceTo:'#moderation'>
	atProtoModeration := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoSize [
	^ atProtoSize
]

{ #category : #accessing }
ComAtprotoAdminDefsBlobView >> atProtoSize: anObject [
	atProtoSize := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> detailsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#imageDetails'. '#videoDetails'};
		label: 'Details';
		accessor: #atProtoDetails
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> mimeTypeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MimeType';
		accessor: #atProtoMimeType;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> moderationDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Moderation';
		accessor: #atProtoModeration
]

{ #category : #magritte }
ComAtprotoAdminDefsBlobView >> sizeDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Size';
		accessor: #atProtoSize;
	beRequired
]
