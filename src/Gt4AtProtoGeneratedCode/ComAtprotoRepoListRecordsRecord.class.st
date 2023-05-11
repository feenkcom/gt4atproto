Class {
	#name : #ComAtprotoRepoListRecordsRecord,
	#superclass : #Object,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoListRecordsRecord class >> fromRequest: aRequest [
	^ self new atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpUri [
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpValue [
	^ atpValue
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
	beRequired
]
