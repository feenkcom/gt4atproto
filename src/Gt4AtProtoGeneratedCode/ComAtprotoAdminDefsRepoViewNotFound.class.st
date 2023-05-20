Class {
	#name : #ComAtprotoAdminDefsRepoViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoViewNotFound'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoViewNotFound class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoViewNotFound >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoViewNotFound >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]
