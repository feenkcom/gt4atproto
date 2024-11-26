Class {
	#name : #ComAtprotoSyncSubscribeReposRepoOp,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAction',
		'atpPath',
		'atpCid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp class >> atpDescription [
 ^  'A repo operation, ie a mutation of a single record.'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#repoOp'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp class >> atpSchema [
 ^ '{"type":"object","description":"A repo operation, ie a mutation of a single record.","required":["action","path","cid"],"nullable":["cid"],"properties":{"action":{"type":"string","knownValues":["create","update","delete"]},"path":{"type":"string"},"cid":{"type":"cid-link","description":"For creates and updates, the new record CID. For deletions, null."}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposRepoOp class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpAction: (aRequest at: 'action' ifAbsent: [ nil ]);
		atpPath: (aRequest at: 'path' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> actionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Action';
		accessor: #atpAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpAction [
	<atpType:#String format:nil>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpAction: anObject [
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpCid [
	<atpType:#String format:nil>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpPath [
	<atpType:#String format:nil>
	^ atpPath
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpPath: anObject [
	atpPath := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> pathDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Path';
		accessor: #atpPath;
		beRequired
]
