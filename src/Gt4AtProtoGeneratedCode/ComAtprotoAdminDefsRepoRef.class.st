Class {
	#name : #ComAtprotoAdminDefsRepoRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoRef'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoRef class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoRef >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]
