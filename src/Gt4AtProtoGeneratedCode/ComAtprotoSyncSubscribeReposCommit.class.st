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
		'atpTime',
		'atpRev',
		'atpSince'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#commit'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit class >> atpSchema [
 ^ '{"type":"object","required":["seq","rebase","tooBig","repo","commit","prev","blocks","ops","blobs","time"],"nullable":["prev"],"properties":{"seq":{"type":"integer"},"rebase":{"type":"boolean"},"tooBig":{"type":"boolean"},"repo":{"type":"string","format":"did"},"commit":{"type":"cid-link"},"prev":{"type":"cid-link"},"blocks":{"type":"bytes","description":"CAR file containing relevant blocks","maxLength":1000000},"ops":{"type":"array","items":{"type":"ref","ref":"#repoOp"},"maxLength":200},"blobs":{"type":"array","items":{"type":"cid-link"}},"time":{"type":"string","format":"datetime"}}}'
]

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
		atpOps: (aRequest
				at: 'ops'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoSyncSubscribeReposRepoOp fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpBlobs: (aRequest
				at: 'blobs'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlobs [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpBlobs
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlobs: anObject [
	atpBlobs := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlocks [
	<atpType:#ByteArray format:nil>
	^ atpBlocks
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpBlocks: anObject [
	atpBlocks := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpCommit [
	<atpType:#String format:nil>
	^ atpCommit
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpCommit: anObject [
	atpCommit := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpOps [
	<atpType:#ComAtprotoSyncSubscribeReposRepoOp format:nil>
	<atpCollection>
	^ atpOps
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpOps: anObject [
	atpOps := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpPrev [
	<atpType:#String format:nil>
	^ atpPrev
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpPrev: anObject [
	atpPrev := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRebase [
	<atpType:#Boolean format:nil>
	^ atpRebase
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRebase: anObject [
	atpRebase := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRepo [
	<atpType:#String format:'did'>
	^ atpRepo
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRepo: anObject [
	atpRepo := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSeq [
	<atpType:#Number format:nil>
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSince [
	<atpType:#String format:nil>
	^ atpSince
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpSince: anObject [
	atpSince := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTime [
	<atpType:#String format:'datetime'>
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit >> atpTooBig [
	<atpType:#Boolean format:nil>
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
ComAtprotoSyncSubscribeReposCommit >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
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
ComAtprotoSyncSubscribeReposCommit >> sinceDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Since';
		accessor: #atpSince;
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
