Class {
	#name : #ComAtprotoRepoListRecordsRecord,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoListRecordsRecord class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
