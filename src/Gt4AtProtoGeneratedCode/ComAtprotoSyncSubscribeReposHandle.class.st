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
ComAtprotoSyncSubscribeReposHandle class >> atpDescription [
 ^  'DEPRECATED -- Use #identity event instead'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#handle'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle class >> atpSchema [
 ^ '{"type":"object","description":"DEPRECATED -- Use #identity event instead","required":["seq","did","handle","time"],"properties":{"seq":{"type":"integer"},"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"time":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposHandle class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpSeq [
	<atpType:#Number format:nil>
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposHandle >> atpTime [
	<atpType:#String format:'datetime'>
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
