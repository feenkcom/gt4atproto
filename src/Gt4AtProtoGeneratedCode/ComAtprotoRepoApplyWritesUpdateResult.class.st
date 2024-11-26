Class {
	#name : #ComAtprotoRepoApplyWritesUpdateResult,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpValidationStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#updateResult'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"validationStatus":{"type":"string","knownValues":["valid","unknown"]}}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesUpdateResult class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpValidationStatus: (aRequest at: 'validationStatus' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpValidationStatus [
	<atpType:#String format:nil>
	^ atpValidationStatus
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdateResult >> atpValidationStatus: anObject [
	atpValidationStatus := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdateResult >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdateResult >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdateResult >> validationStatusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ValidationStatus';
		accessor: #atpValidationStatus
]
