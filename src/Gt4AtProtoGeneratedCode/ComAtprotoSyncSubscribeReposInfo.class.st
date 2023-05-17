Class {
	#name : #ComAtprotoSyncSubscribeReposInfo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#info'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo class >> atpSchema [
 ^ '{"type":"object","required":["name"],"properties":{"name":{"type":"string","knownValues":["OutdatedCursor"]},"message":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposInfo class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpMessage [
	<atpType:#String format:nil>
	^ atpMessage
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposInfo >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atpMessage
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposInfo >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]
