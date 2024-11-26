Class {
	#name : #ComAtprotoServerDescribeServerLinks,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPrivacyPolicy',
		'atpTermsOfService'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks class >> atpFile [
 ^ 'com/atproto/server/describeServer.json'
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks class >> atpRecordName [
 ^ 'com.atproto.server.describeServer#links'
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks class >> atpSchema [
 ^ '{"type":"object","properties":{"privacyPolicy":{"type":"string","format":"uri"},"termsOfService":{"type":"string","format":"uri"}}}'
]

{ #category : #serialization }
ComAtprotoServerDescribeServerLinks class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpPrivacyPolicy: (aRequest at: 'privacyPolicy' ifAbsent: [ nil ]);
		atpTermsOfService: (aRequest at: 'termsOfService' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpPrivacyPolicy [
	<atpType:#String format:'uri'>
	^ atpPrivacyPolicy
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpPrivacyPolicy: anObject [
	atpPrivacyPolicy := anObject
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpTermsOfService [
	<atpType:#String format:'uri'>
	^ atpTermsOfService
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpTermsOfService: anObject [
	atpTermsOfService := anObject
]

{ #category : #magritte }
ComAtprotoServerDescribeServerLinks >> privacyPolicyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'PrivacyPolicy';
		accessor: #atpPrivacyPolicy
]

{ #category : #magritte }
ComAtprotoServerDescribeServerLinks >> termsOfServiceDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'TermsOfService';
		accessor: #atpTermsOfService
]
