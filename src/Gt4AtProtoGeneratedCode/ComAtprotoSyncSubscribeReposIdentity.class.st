Class {
	#name : #ComAtprotoSyncSubscribeReposIdentity,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpTime',
		'atpHandle'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity class >> atpDescription [
 ^  'Represents a change to an account''s identity. Could be an updated handle, signing key, or pds hosting endpoint. Serves as a prod to all downstream services to refresh their identity cache.'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#identity'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity class >> atpSchema [
 ^ '{"type":"object","description":"Represents a change to an account''s identity. Could be an updated handle, signing key, or pds hosting endpoint. Serves as a prod to all downstream services to refresh their identity cache.","required":["seq","did","time"],"properties":{"seq":{"type":"integer"},"did":{"type":"string","format":"did"},"time":{"type":"string","format":"datetime"},"handle":{"type":"string","format":"handle","description":"The current handle for the account, or ''handle.invalid'' if validation fails. This field is optional, might have been validated or passed-through from an upstream source. Semantics and behaviors for PDS vs Relay may evolve in the future; see atproto specs for more details."}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposIdentity class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpSeq [
	<atpType:#Number format:nil>
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpTime [
	<atpType:#String format:'datetime'>
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposIdentity >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposIdentity >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposIdentity >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposIdentity >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposIdentity >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
		beRequired
]
