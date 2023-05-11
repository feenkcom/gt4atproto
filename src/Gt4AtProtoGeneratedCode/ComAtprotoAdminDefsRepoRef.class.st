Class {
	#name : #ComAtprotoAdminDefsRepoRef,
	#superclass : #Object,
	#instVars : [
		'atProtoDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsRepoRef class >> fromRequest: aRequest [
	^ self new atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoRef >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoRef >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]
