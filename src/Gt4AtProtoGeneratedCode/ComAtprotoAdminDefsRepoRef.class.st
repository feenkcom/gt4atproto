Class {
	#name : #ComAtprotoAdminDefsRepoRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoRef'
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
