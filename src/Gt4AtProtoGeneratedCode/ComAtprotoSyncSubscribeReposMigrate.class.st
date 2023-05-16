Class {
	#name : #ComAtprotoSyncSubscribeReposMigrate,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpMigrateTo',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#migrate'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate class >> atpSchema [
 ^ '{"type":"object","required":["seq","did","migrateTo","time"],"nullable":["migrateTo"],"properties":{"seq":{"type":"integer"},"did":{"type":"string","format":"did"},"migrateTo":{"type":"string"},"time":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposMigrate class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpMigrateTo: (aRequest at: 'migrateTo' ifAbsent: [ nil ]);
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpDid [
	<atpType:'string' format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpMigrateTo [
	<atpType:'string' format:nil>
	^ atpMigrateTo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpMigrateTo: anObject [
	atpMigrateTo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpSeq [
	<atpType:#Number format:nil>
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpTime [
	<atpType:'string' format:'datetime'>
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> migrateToDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MigrateTo';
		accessor: #atpMigrateTo;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
		beRequired
]
