Class {
	#name : #ComAtprotoRepoListMissingBlobsRecordBlob,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCid',
		'atpRecordUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob class >> atpFile [
 ^ 'com/atproto/repo/listMissingBlobs.json'
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob class >> atpRecordName [
 ^ 'com.atproto.repo.listMissingBlobs#recordBlob'
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob class >> atpSchema [
 ^ '{"type":"object","required":["cid","recordUri"],"properties":{"cid":{"type":"string","format":"cid"},"recordUri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
ComAtprotoRepoListMissingBlobsRecordBlob class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpRecordUri: (aRequest at: 'recordUri' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob >> atpRecordUri [
	<atpType:#String format:'at-uri'>
	^ atpRecordUri
]

{ #category : #accessing }
ComAtprotoRepoListMissingBlobsRecordBlob >> atpRecordUri: anObject [
	atpRecordUri := anObject
]

{ #category : #magritte }
ComAtprotoRepoListMissingBlobsRecordBlob >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoListMissingBlobsRecordBlob >> recordUriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'RecordUri';
		accessor: #atpRecordUri;
		beRequired
]
