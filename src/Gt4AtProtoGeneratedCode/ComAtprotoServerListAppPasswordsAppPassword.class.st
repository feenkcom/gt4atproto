Class {
	#name : #ComAtprotoServerListAppPasswordsAppPassword,
	#superclass : #Object,
	#instVars : [
		'atpName',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerListAppPasswordsAppPassword class >> fromRequest: aRequest [
	^ self new atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpName [
	^ atpName
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ComAtprotoServerListAppPasswordsAppPassword >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoServerListAppPasswordsAppPassword >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
	beRequired
]