Class {
	#name : #XRPCHistoricalRequest,
	#superclass : #Object,
	#instVars : [
		'request',
		'response',
		'methodId'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
XRPCHistoricalRequest >> gtRequestFor: aView [
	<gtView>
	^ (request gtViewRequestLineTextFor: aView) priority: 1
]

{ #category : #accessing }
XRPCHistoricalRequest >> gtResponseFor: aView context: aContext [
	<gtView>
	^ (response gtJSONFor: aView context: aContext)
		title: 'Response';
		priority: 2
]

{ #category : #accessing }
XRPCHistoricalRequest >> methodId [
	^ methodId
]

{ #category : #accessing }
XRPCHistoricalRequest >> methodId: anObject [
	methodId := anObject
]

{ #category : #accessing }
XRPCHistoricalRequest >> printOn: aStream [
	super printOn: aStream.

	aStream parenthesize: [ aStream << self methodId ]
]

{ #category : #accessing }
XRPCHistoricalRequest >> request [
	^ request
]

{ #category : #accessing }
XRPCHistoricalRequest >> request: anObject [
	request := anObject
]

{ #category : #accessing }
XRPCHistoricalRequest >> response [
	^ response
]

{ #category : #accessing }
XRPCHistoricalRequest >> response: anObject [
	response := anObject
]
