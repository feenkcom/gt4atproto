Class {
	#name : #ComAtprotoSyncSubscribeReposRepoOp,
	#superclass : #Object,
	#instVars : [
		'atProtoAction',
		'atProtoPath',
		'atProtoCid'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> actionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Action';
		accessor: #atProtoAction;
	beRequired
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoAction [
	^ atProtoAction
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoAction: anObject [
	atProtoAction := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoPath [
	^ atProtoPath
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposRepoOp >> atProtoPath: anObject [
	atProtoPath := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposRepoOp >> pathDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Path';
		accessor: #atProtoPath;
	beRequired
]
