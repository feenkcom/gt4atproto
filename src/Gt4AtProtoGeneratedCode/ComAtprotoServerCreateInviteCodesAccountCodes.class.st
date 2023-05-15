Class {
	#name : #ComAtprotoServerCreateInviteCodesAccountCodes,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAccount',
		'atpCodes'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes class >> atpFile [
 ^ 'com/atproto/server/createInviteCodes.json'
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes class >> atpRecordName [
 ^ 'com.atproto.server.createInviteCodes#accountCodes'
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes class >> atpSchema [
 ^ '{"type":"object","required":["account","codes"],"properties":{"account":{"type":"string"},"codes":{"type":"array","items":{"type":"string"}}}}'
]

{ #category : #serialization }
ComAtprotoServerCreateInviteCodesAccountCodes class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpAccount: (aRequest at: 'account' ifAbsent: [ nil ]); 
		atpCodes: (aRequest at: 'codes' ifPresent: [:anArray | anArray collect: [:aValue |aValue ] ] ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoServerCreateInviteCodesAccountCodes >> accountDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Account';
		accessor: #atpAccount;
	beRequired
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atpAccount [
	^ atpAccount
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atpAccount: anObject [
	atpAccount := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atpCodes [
	^ atpCodes
]

{ #category : #accessing }
ComAtprotoServerCreateInviteCodesAccountCodes >> atpCodes: anObject [
	atpCodes := anObject
]

{ #category : #magritte }
ComAtprotoServerCreateInviteCodesAccountCodes >> codesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Codes';
		accessor: #atpCodes;
	beRequired
]
