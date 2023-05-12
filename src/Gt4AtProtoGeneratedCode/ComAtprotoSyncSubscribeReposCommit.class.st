Class {
	#name : #ComAtprotoSyncSubscribeReposCommit,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpRebase',
		'atpTooBig',
		'atpRepo',
		'atpCommit',
		'atpPrev',
		'atpBlocks',
		'atpOps',
		'atpBlobs',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncSubscribeReposCommit class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atpRebase: (aRequest at: 'rebase' ifAbsent: [ nil ]); 
		atpTooBig: (aRequest at: 'tooBig' ifAbsent: [ nil ]); 
		atpRepo: (aRequest at: 'repo' ifAbsent: [ nil ]); 
		atpCommit: (aRequest at: 'commit' ifAbsent: [ nil ]); 
		atpPrev: (aRequest at: 'prev' ifAbsent: [ nil ]); 
		atpBlocks: (aRequest at: 'blocks' ifAbsent: [ nil ]); 
		atpOps: (aRequest at: 'ops' ifAbsent: [ nil ]); 
		atpBlobs: (aRequest at: 'blobs' ifAbsent: [ nil ]); 
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlobs [
	^ atpBlobs
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlobs: anObject [
	atpBlobs := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlocks [
	^ atpBlocks
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlocks: anObject [
	atpBlocks := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpCommit [
	^ atpCommit
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpCommit: anObject [
	atpCommit := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpOps [
	^ atpOps
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpOps: anObject [
	atpOps := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpPrev [
	^ atpPrev
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpPrev: anObject [
	atpPrev := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRebase [
	^ atpRebase
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRebase: anObject [
	atpRebase := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRepo [
	^ atpRepo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRepo: anObject [
	atpRepo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSeq [
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTime [
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTooBig [
	^ atpTooBig
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTooBig: anObject [
	atpTooBig := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> blobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Blobs';
		accessor: #atpBlobs;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> blocksDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Blocks';
		accessor: #atpBlocks;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> commitDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Commit';
		accessor: #atpCommit;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> opsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoSyncSubscribeReposRepoOp};
		label: 'Ops';
		accessor: #atpOps;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> prevDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Prev';
		accessor: #atpPrev;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> rebaseDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Rebase';
		accessor: #atpRebase;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> repoDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repo';
		accessor: #atpRepo;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> tooBigDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'TooBig';
		accessor: #atpTooBig;
	beRequired
]
