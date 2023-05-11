Class {
	#name : #ComAtprotoSyncSubscribeReposTombstone,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoDid',
		'atProtoTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncSubscribeReposTombstone class >> fromRequest: aRequest [
	^ self new atProtoSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atProtoTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoSeq [
	^ atProtoSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoSeq: anObject [
	atProtoSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoTime [
	^ atProtoTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atProtoTime: anObject [
	atProtoTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atProtoTime;
	beRequired
]
