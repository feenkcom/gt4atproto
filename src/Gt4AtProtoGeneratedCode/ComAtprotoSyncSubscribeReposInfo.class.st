Class {
	#name : #ComAtprotoSyncSubscribeReposInfo,
	#superclass : #Object,
	#instVars : [
		'atpName',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncSubscribeReposInfo class >> fromRequest: aRequest [
	^ self new atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpMessage [
	^ atpMessage
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpName [
	^ atpName
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atpMessage
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
	beRequired
]
