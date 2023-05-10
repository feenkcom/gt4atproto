Class {
	#name : #ComAtprotoSyncSubscribeReposMigrate,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoDid',
		'atProtoMigrateTo',
		'atProtoTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoMigrateTo [
	^ atProtoMigrateTo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoMigrateTo: anObject [
	atProtoMigrateTo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoSeq [
	^ atProtoSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoSeq: anObject [
	atProtoSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoTime [
	^ atProtoTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposMigrate >> atProtoTime: anObject [
	atProtoTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> migrateToDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MigrateTo';
		accessor: #atProtoMigrateTo;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> seqDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposMigrate >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atProtoTime;
	beRequired
]
