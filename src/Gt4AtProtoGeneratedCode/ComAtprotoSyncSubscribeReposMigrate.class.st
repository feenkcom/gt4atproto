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
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpMigrateTo [
	^ atpMigrateTo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpMigrateTo: anObject [
	atpMigrateTo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpSeq [
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atpTime [
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
