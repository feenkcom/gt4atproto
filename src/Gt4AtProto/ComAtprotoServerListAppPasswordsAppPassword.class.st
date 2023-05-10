Class {
	#name : #ComAtprotoServerListAppPasswordsAppPassword,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoCreatedAt'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atProtoName [
	^ atProtoName
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atProtoName: anObject [
	atProtoName := anObject
]

{ #category : #magritte }
ComAtprotoServerListAppPasswordsAppPassword >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerListAppPasswordsAppPassword >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atProtoName;
	beRequired
]
