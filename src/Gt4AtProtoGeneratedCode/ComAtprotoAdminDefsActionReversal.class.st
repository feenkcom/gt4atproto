Class {
	#name : #ComAtprotoAdminDefsActionReversal,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpReason',
		'atpCreatedBy',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal class >> atpRecordName [
 ^ 'com.atproto.admin.defs#actionReversal'
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal class >> atpSchema [
 ^ '{"type":"object","required":["reason","createdBy","createdAt"],"properties":{"reason":{"type":"string"},"createdBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsActionReversal class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpCreatedBy [
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpReason [
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason;
	beRequired
]
