Class {
	#name : #ComAtprotoServerCreateAppPasswordAppPassword,
	#superclass : #Object,
	#instVars : [
		'atpName',
		'atpPassword',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerCreateAppPasswordAppPassword class >> fromRequest: aRequest [
	^ self new atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpPassword: (aRequest at: 'password' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpName [
	^ atpName
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPassword [
	^ atpPassword
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPassword: anObject [
	atpPassword := anObject
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> passwordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Password';
		accessor: #atpPassword;
	beRequired
]