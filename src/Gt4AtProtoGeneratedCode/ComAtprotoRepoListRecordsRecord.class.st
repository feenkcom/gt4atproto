Class {
	#name : #ComAtprotoRepoListRecordsRecord,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord class >> atpFile [
 ^ 'com/atproto/repo/listRecords.json'
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord class >> atpRecordName [
 ^ 'com.atproto.repo.listRecords#record'
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","value"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"value":{"type":"unknown"}}}'
]

{ #category : #serialization }
ComAtprotoRepoListRecordsRecord class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpValue: (aRequest
				at: 'value'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpValue [
	<atpType:#Object format:nil>
	^ atpValue
]

{ #category : #accessing }
ComAtprotoRepoListRecordsRecord >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoListRecordsRecord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
