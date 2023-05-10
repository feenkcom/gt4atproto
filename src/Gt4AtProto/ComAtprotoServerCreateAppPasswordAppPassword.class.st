Class {
	#name : #ComAtprotoServerCreateAppPasswordAppPassword,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoPassword',
		'atProtoCreatedAt'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoName [
	^ atProtoName
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoName: anObject [
	atProtoName := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoPassword [
	^ atProtoPassword
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atProtoPassword: anObject [
	atProtoPassword := anObject
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atProtoName;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> passwordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Password';
		accessor: #atProtoPassword;
	beRequired
]
