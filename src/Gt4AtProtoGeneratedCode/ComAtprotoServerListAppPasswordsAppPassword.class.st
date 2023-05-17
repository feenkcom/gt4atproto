Class {
	#name : #ComAtprotoServerListAppPasswordsAppPassword,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword class >> atpFile [
 ^ 'com/atproto/server/listAppPasswords.json'
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword class >> atpRecordName [
 ^ 'com.atproto.server.listAppPasswords#appPassword'
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword class >> atpSchema [
 ^ '{"type":"object","required":["name","createdAt"],"properties":{"name":{"type":"string"},"createdAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ComAtprotoServerListAppPasswordsAppPassword class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerListAppPasswordsAppPassword >> atpName [
	<atpType:#String format:nil>
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
