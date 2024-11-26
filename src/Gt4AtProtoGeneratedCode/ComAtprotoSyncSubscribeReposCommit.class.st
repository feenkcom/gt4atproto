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
		'atpRev',
		'atpSince',
		'atpBlocks',
		'atpOps',
		'atpBlobs',
		'atpTime'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposCommit class >> atpDescription [
 ^  'Represents an update of repository state. Note that empty commits are allowed, which include no repo data changes, but an update to rev and signature.'
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
 ^ '{"type":"object","description":"Represents an update of repository state. Note that empty commits are allowed, which include no repo data changes, but an update to rev and signature.","required":["seq","rebase","tooBig","repo","commit","rev","since","blocks","ops","blobs","time"],"nullable":["prev","since"],"properties":{"seq":{"type":"integer","description":"The stream sequence number of this message."},"rebase":{"type":"boolean","description":"DEPRECATED -- unused"},"tooBig":{"type":"boolean","description":"Indicates that this commit contained too many ops, or data size was too large. Consumers will need to make a separate request to get missing data."},"repo":{"type":"string","format":"did","description":"The repo this event comes from."},"commit":{"type":"cid-link","description":"Repo commit object CID."},"prev":{"type":"cid-link","description":"DEPRECATED -- unused. WARNING -- nullable and optional; stick with optional to ensure golang interoperability."},"rev":{"type":"string","description":"The rev of the emitted commit. Note that this information is also in the commit object included in blocks, unless this is a tooBig event."},"since":{"type":"string","description":"The rev of the last emitted commit from this repo (if any)."},"blocks":{"type":"bytes","description":"CAR file containing relevant blocks, as a diff since the previous repo state.","maxLength":1000000},"ops":{"type":"array","items":{"type":"ref","ref":"#repoOp","description":"List of repo mutation operations in this commit (eg, records created, updated, or deleted)."},"maxLength":200},"blobs":{"type":"array","items":{"type":"cid-link","description":"List of new blobs (by CID) referenced by records in this commit."}},"time":{"type":"string","format":"datetime","description":"Timestamp of when this message was originally broadcast."}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposCommit class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]);
		atpRebase: (aRequest at: 'rebase' ifAbsent: [ nil ]);
		atpTooBig: (aRequest at: 'tooBig' ifAbsent: [ nil ]);
		atpRepo: (aRequest at: 'repo' ifAbsent: [ nil ]);
		atpCommit: (aRequest at: 'commit' ifAbsent: [ nil ]);
		atpPrev: (aRequest at: 'prev' ifAbsent: [ nil ]);
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpSince: (aRequest at: 'since' ifAbsent: [ nil ]);
		atpBlocks: (aRequest at: 'blocks' ifAbsent: [ nil ]);
		atpOps: (aRequest
				at: 'ops'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoSyncSubscribeReposRepoOp fromRequest: aValue withClient: aClient ] ]
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
		accessor: #atpPrev
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
