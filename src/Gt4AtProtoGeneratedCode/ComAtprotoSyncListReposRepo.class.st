Class {
	#name : #ComAtprotoSyncListReposRepo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHead',
		'atpRev',
		'atpActive',
		'atpStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncListReposRepo class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo class >> atpFile [
 ^ 'com/atproto/sync/listRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo class >> atpRecordName [
 ^ 'com.atproto.sync.listRepos#repo'
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo class >> atpSchema [
 ^ '{"type":"object","required":["did","head"],"properties":{"did":{"type":"string","format":"did"},"head":{"type":"string","format":"cid"}}}'
]

{ #category : #serialization }
ComAtprotoSyncListReposRepo class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHead: (aRequest at: 'head' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> activeDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Active';
		accessor: #atpActive
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpActive [
	<atpType:#Boolean format:nil>
	^ atpActive
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpActive: anObject [
	atpActive := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpHead [
	<atpType:#String format:'cid'>
	^ atpHead
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpHead: anObject [
	atpHead := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpStatus [
	<atpType:#String format:nil>
	^ atpStatus
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpStatus: anObject [
	atpStatus := anObject
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> headDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Head';
		accessor: #atpHead;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> statusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Status';
		accessor: #atpStatus
]
