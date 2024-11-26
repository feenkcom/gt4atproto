Class {
	#name : #ComAtprotoAdminDefsStatusAttr,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpApplied',
		'atpRef'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr class >> atpRecordName [
 ^ 'com.atproto.admin.defs#statusAttr'
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr class >> atpSchema [
 ^ '{"type":"object","required":["applied"],"properties":{"applied":{"type":"boolean"},"ref":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsStatusAttr class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpApplied: (aRequest at: 'applied' ifAbsent: [ nil ]);
		atpRef: (aRequest at: 'ref' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsStatusAttr >> appliedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Applied';
		accessor: #atpApplied;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr >> atpApplied [
	<atpType:#Boolean format:nil>
	^ atpApplied
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr >> atpApplied: anObject [
	atpApplied := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr >> atpRef [
	<atpType:#String format:nil>
	^ atpRef
]

{ #category : #accessing }
ComAtprotoAdminDefsStatusAttr >> atpRef: anObject [
	atpRef := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsStatusAttr >> refDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Ref';
		accessor: #atpRef
]
