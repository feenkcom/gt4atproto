Class {
	#name : #ComAtprotoServerDescribeServerContact,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpEmail'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerDescribeServerContact class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoServerDescribeServerContact class >> atpFile [
 ^ 'com/atproto/server/describeServer.json'
]

{ #category : #accessing }
ComAtprotoServerDescribeServerContact class >> atpRecordName [
 ^ 'com.atproto.server.describeServer#contact'
]

{ #category : #accessing }
ComAtprotoServerDescribeServerContact class >> atpSchema [
 ^ '{"type":"object","properties":{"email":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoServerDescribeServerContact class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpEmail: (aRequest at: 'email' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDescribeServerContact >> atpEmail [
	<atpType:#String format:nil>
	^ atpEmail
]

{ #category : #accessing }
ComAtprotoServerDescribeServerContact >> atpEmail: anObject [
	atpEmail := anObject
]

{ #category : #magritte }
ComAtprotoServerDescribeServerContact >> emailDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Email';
		accessor: #atpEmail
]
