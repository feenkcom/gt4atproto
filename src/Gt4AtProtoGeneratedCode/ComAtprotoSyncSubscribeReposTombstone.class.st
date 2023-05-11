Class {
	#name : #ComAtprotoSyncSubscribeReposTombstone,
	#superclass : #Object,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncSubscribeReposTombstone class >> fromRequest: aRequest [
	^ self new atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpSeq [
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpTime [
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposTombstone >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
	beRequired
]
