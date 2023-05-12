Class {
	#name : #ComAtprotoSyncSubscribeReposHandle,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpHandle',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#handle'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposHandle class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpHandle [
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpSeq [
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpTime [
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposHandle >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
	beRequired
]
