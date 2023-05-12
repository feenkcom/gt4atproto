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
 ^ ''
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks class >> atpRecordName [
 ^ 'com.atproto.server.describeServer#links'
]

{ #category : #serialization }
ComAtprotoServerDescribeServerLinks class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPrivacyPolicy: (aRequest at: 'privacyPolicy' ifAbsent: [ nil ]); 
		atpTermsOfService: (aRequest at: 'termsOfService' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpPrivacyPolicy [
	^ atpPrivacyPolicy
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpPrivacyPolicy: anObject [
	atpPrivacyPolicy := anObject
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atpTermsOfService [
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
