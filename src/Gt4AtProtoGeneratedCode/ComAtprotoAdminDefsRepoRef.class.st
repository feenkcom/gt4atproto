Class {
	#name : #ComAtprotoAdminDefsRepoRef,
	#superclass : #Object,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRepoRef class >> fromRequest: aRequest [
	^ self new atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
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
