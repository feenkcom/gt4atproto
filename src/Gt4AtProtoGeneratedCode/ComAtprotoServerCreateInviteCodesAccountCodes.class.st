Class {
	#name : #ComAtprotoServerCreateInviteCodesAccountCodes,
	#superclass : #Object,
	#instVars : [
		'atProtoAccount',
		'atProtoCodes'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoServerCreateInviteCodesAccountCodes class >> fromRequest: aRequest [
	^ self new atProtoAccount: (aRequest at: 'account' ifAbsent: [ nil ]); 
		atProtoCodes: (aRequest at: 'codes' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoServerCreateInviteCodesAccountCodes >> accountDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Account';
		accessor: #atProtoAccount;
	beRequired
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atProtoAccount [
	^ atProtoAccount
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atProtoAccount: anObject [
	atProtoAccount := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atProtoCodes [
	^ atProtoCodes
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atProtoCodes: anObject [
	atProtoCodes := anObject
]

{ #category : #magritte }
ComAtprotoServerCreateInviteCodesAccountCodes >> codesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Codes';
		accessor: #atProtoCodes;
	beRequired
]
