Class {
	#name : #ComAtprotoServerCreateAppPasswordAppPassword,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpPassword',
		'atpCreatedAt',
		'atpPrivileged'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword class >> atpFile [
 ^ 'com/atproto/server/createAppPassword.json'
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword class >> atpRecordName [
 ^ 'com.atproto.server.createAppPassword#appPassword'
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword class >> atpSchema [
 ^ '{"type":"object","required":["name","password","createdAt"],"properties":{"name":{"type":"string"},"password":{"type":"string"},"createdAt":{"type":"string","format":"datetime"},"privileged":{"type":"boolean"}}}'
]

{ #category : #serialization }
ComAtprotoServerCreateAppPasswordAppPassword class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpPassword: (aRequest at: 'password' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpPrivileged: (aRequest at: 'privileged' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPassword [
	<atpType:#String format:nil>
	^ atpPassword
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPassword: anObject [
	atpPassword := anObject
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPrivileged [
	<atpType:#Boolean format:nil>
	^ atpPrivileged
]

{ #category : #accessing }
ComAtprotoServerCreateAppPasswordAppPassword >> atpPrivileged: anObject [
	atpPrivileged := anObject
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

{ #category : #magritte }
ComAtprotoServerCreateAppPasswordAppPassword >> privilegedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Privileged';
		accessor: #atpPrivileged
]
