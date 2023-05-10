Class {
	#name : #ComAtprotoAdminDefsActionReversal,
	#superclass : #Object,
	#instVars : [
		'atProtoReason',
		'atProtoCreatedBy',
		'atProtoCreatedAt'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoCreatedBy [
	^ atProtoCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoCreatedBy: anObject [
	atProtoCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionReversal >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atProtoCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionReversal >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason;
	beRequired
]
