Class {
	#name : #ComAtprotoSyncSubscribeReposHandle,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoDid',
		'atProtoHandle',
		'atProtoTime'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoSeq [
	^ atProtoSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoSeq: anObject [
	atProtoSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoTime [
	^ atProtoTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atProtoTime: anObject [
	atProtoTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> seqDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atProtoTime;
	beRequired
]
