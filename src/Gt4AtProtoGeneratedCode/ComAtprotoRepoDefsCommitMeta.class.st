Class {
	#name : #ComAtprotoRepoDefsCommitMeta,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCid',
		'atpRev'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta class >> atpFile [
 ^ 'com/atproto/repo/defs.json'
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta class >> atpRecordName [
 ^ 'com.atproto.repo.defs#commitMeta'
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta class >> atpSchema [
 ^ '{"type":"object","required":["cid","rev"],"properties":{"cid":{"type":"string","format":"cid"},"rev":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoRepoDefsCommitMeta class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ComAtprotoRepoDefsCommitMeta >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #magritte }
ComAtprotoRepoDefsCommitMeta >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoDefsCommitMeta >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]
