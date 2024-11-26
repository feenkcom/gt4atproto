Class {
	#name : #ComAtprotoRepoStrongRefMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoStrongRefMain class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain class >> atpFile [
 ^ 'com/atproto/repo/strongRef.json'
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain class >> atpRecordName [
 ^ 'com.atproto.repo.strongRef'
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"}}}'
]

{ #category : #serialization }
ComAtprotoRepoStrongRefMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
