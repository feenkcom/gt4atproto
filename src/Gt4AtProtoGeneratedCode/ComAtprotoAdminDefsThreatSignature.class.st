Class {
	#name : #ComAtprotoAdminDefsThreatSignature,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpProperty',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature class >> atpRecordName [
 ^ 'com.atproto.admin.defs#threatSignature'
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature class >> atpSchema [
 ^ '{"type":"object","required":["property","value"],"properties":{"property":{"type":"string"},"value":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsThreatSignature class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpProperty: (aRequest at: 'property' ifAbsent: [ nil ]);
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature >> atpProperty [
	<atpType:#String format:nil>
	^ atpProperty
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature >> atpProperty: anObject [
	atpProperty := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature >> atpValue [
	<atpType:#String format:nil>
	^ atpValue
]

{ #category : #accessing }
ComAtprotoAdminDefsThreatSignature >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsThreatSignature >> propertyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Property';
		accessor: #atpProperty;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsThreatSignature >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
