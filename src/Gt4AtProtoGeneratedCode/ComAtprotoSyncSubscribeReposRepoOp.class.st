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
 ^ ''
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
 ^ '{"type":"object","required":["action","path","cid"],"nullable":["cid"],"properties":{"action":{"type":"string","knownValues":["create","update","delete"]},"path":{"type":"string"},"cid":{"type":"cid-link"}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposRepoOp class >> fromRequest: aRequest [
	^ self new
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
	^ atpAction
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpAction: anObject [
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atpPath [
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
