Class {
	#name : #ComAtprotoAdminDefsRepoBlobRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpCid',
		'atpRecordUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef class >> atpRecordName [
 ^ 'com.atproto.admin.defs#repoBlobRef'
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef class >> atpSchema [
 ^ '{"type":"object","required":["did","cid"],"properties":{"did":{"type":"string","format":"did"},"cid":{"type":"string","format":"cid"},"recordUri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRepoBlobRef class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpRecordUri: (aRequest at: 'recordUri' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpRecordUri [
	<atpType:#String format:'at-uri'>
	^ atpRecordUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRepoBlobRef >> atpRecordUri: anObject [
	atpRecordUri := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoBlobRef >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoBlobRef >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsRepoBlobRef >> recordUriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'RecordUri';
		accessor: #atpRecordUri
]
