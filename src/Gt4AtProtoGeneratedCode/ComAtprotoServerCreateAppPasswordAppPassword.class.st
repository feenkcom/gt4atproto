Class {
	#name : #ComAtprotoServerCreateAppPasswordAppPassword,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoPassword',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerCreateAppPasswordAppPassword class >> fromRequest: aRequest [
	^ self new atProtoName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atProtoPassword: (aRequest at: 'password' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

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
