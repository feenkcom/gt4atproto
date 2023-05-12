Class {
	#name : #ComAtprotoSyncSubscribeReposTombstone,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#tombstone'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposTombstone class >> atpSchema [
 ^ '{"type":"object","required":["seq","did","time"],"properties":{"seq":{"type":"integer"},"did":{"type":"string","format":"did"},"time":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposTombstone class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
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
