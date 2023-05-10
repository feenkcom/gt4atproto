Class {
	#name : #ComAtprotoSyncSubscribeReposCommit,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoRebase',
		'atProtoTooBig',
		'atProtoRepo',
		'atProtoCommit',
		'atProtoPrev',
		'atProtoBlocks',
		'atProtoOps',
		'atProtoBlobs',
		'atProtoTime'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoBlobs [
	^ atProtoBlobs
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoBlobs: anObject [
	atProtoBlobs := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoBlocks [
	^ atProtoBlocks
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoBlocks: anObject [
	atProtoBlocks := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoCommit [
	^ atProtoCommit
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoCommit: anObject [
	atProtoCommit := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoOps [
	^ atProtoOps
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoOps: anObject [
	atProtoOps := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoPrev [
	^ atProtoPrev
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoPrev: anObject [
	atProtoPrev := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoRebase [
	^ atProtoRebase
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoRebase: anObject [
	atProtoRebase := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoRepo [
	^ atProtoRepo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoRepo: anObject [
	atProtoRepo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoSeq [
	^ atProtoSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoSeq: anObject [
	atProtoSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoTime [
	^ atProtoTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoTime: anObject [
	atProtoTime := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoTooBig [
	^ atProtoTooBig
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atProtoTooBig: anObject [
	atProtoTooBig := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> blobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Blobs';
		accessor: #atProtoBlobs;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> blocksDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Blocks';
		accessor: #atProtoBlocks;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> commitDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Commit';
		accessor: #atProtoCommit;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> opsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {RepoOp};
		label: 'Ops';
		accessor: #atProtoOps;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> prevDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Prev';
		accessor: #atProtoPrev;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> rebaseDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Rebase';
		accessor: #atProtoRebase;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> repoDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repo';
		accessor: #atProtoRepo;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> seqDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atProtoTime;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposCommit >> tooBigDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'TooBig';
		accessor: #atProtoTooBig;
	beRequired
]
