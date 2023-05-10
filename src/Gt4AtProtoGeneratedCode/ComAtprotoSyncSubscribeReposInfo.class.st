Class {
	#name : #ComAtprotoSyncSubscribeReposInfo,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atProtoMessage [
	^ atProtoMessage
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atProtoMessage: anObject [
	atProtoMessage := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atProtoName [
	^ atProtoName
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atProtoName: anObject [
	atProtoName := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atProtoMessage
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atProtoName;
	beRequired
]
