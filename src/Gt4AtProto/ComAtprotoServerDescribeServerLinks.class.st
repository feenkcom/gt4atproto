Class {
	#name : #ComAtprotoServerDescribeServerLinks,
	#superclass : #Object,
	#instVars : [
		'atProtoPrivacyPolicy',
		'atProtoTermsOfService'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atProtoPrivacyPolicy [
	^ atProtoPrivacyPolicy
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atProtoPrivacyPolicy: anObject [
	atProtoPrivacyPolicy := anObject
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atProtoTermsOfService [
	^ atProtoTermsOfService
]

{ #category : #accessing }
ComAtprotoServerDescribeServerLinks >> atProtoTermsOfService: anObject [
	atProtoTermsOfService := anObject
]

{ #category : #magritte }
ComAtprotoServerDescribeServerLinks >> privacyPolicyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'PrivacyPolicy';
		accessor: #atProtoPrivacyPolicy
]

{ #category : #magritte }
ComAtprotoServerDescribeServerLinks >> termsOfServiceDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'TermsOfService';
		accessor: #atProtoTermsOfService
]
