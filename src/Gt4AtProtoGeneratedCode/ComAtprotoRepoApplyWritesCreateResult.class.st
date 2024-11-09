Class {
	#name : #ComAtprotoRepoApplyWritesCreateResult,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValidationStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#createResult'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"validationStatus":{"type":"string","knownValues":["valid","unknown"]}}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesCreateResult class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpValidationStatus: (aRequest at: 'validationStatus' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpValidationStatus [
	<atpType:#String format:nil>
	^ atpValidationStatus
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreateResult >> atpValidationStatus: anObject [
	atpValidationStatus := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreateResult >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreateResult >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreateResult >> validationStatusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ValidationStatus';
		accessor: #atpValidationStatus
]
