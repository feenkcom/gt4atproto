Class {
	#name : #GtXRPCClient,
	#superclass : #Object,
	#instVars : [
		'client',
		'methodId',
		'request',
		'response',
		'historicalRequests'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtXRPCClient >> asHistoricalRequest [
	| aRequest |
	aRequest := XRPCHistoricalRequest new
		request: request;
		response: response;
		methodId: methodId.
		
	historicalRequests add: aRequest.
		
	^ aRequest
]

{ #category : #accessing }
GtXRPCClient >> body: aString [
	self client
		contents: aString;
		contentType: ZnMimeType applicationJson
]

{ #category : #accessing }
GtXRPCClient >> client [
	^ client
]

{ #category : #accessing }
GtXRPCClient >> client: anObject [
	client := anObject
]

{ #category : #accessing }
GtXRPCClient >> contentType: aContentType [
	self client contentType: aContentType
]

{ #category : #accessing }
GtXRPCClient >> initialize [
	historicalRequests := OrderedCollection new
]

{ #category : #accessing }
GtXRPCClient >> methodId [
	^ methodId
]

{ #category : #accessing }
GtXRPCClient >> methodId: aString [
	methodId := aString.
	self client addPath: aString
]

{ #category : #accessing }
GtXRPCClient >> parameters: aDictionary [
	self client queryAddAll: aDictionary
]

{ #category : #accessing }
GtXRPCClient >> printOn: aStream [
	super printOn: aStream.

	aStream parenthesize: [ aStream << self methodId ]
]

{ #category : #accessing }
GtXRPCClient >> procedure [
	request := self client request.
	response := self client post.

	historicalRequests
		do: [ :aRequest | 
			aRequest
				request: request;
				response: response ].

	^ response ifNil: [ response ] ifNotNil: [ STONJSON fromString: response ]
]

{ #category : #accessing }
GtXRPCClient >> query [
	request := self client request.
	response := self client get.

	historicalRequests
		do: [ :aRequest | 
			aRequest
				request: request;
				response: response ].

	^ STONJSON fromString: response
]

{ #category : #accessing }
GtXRPCClient >> queryAddAll: aDictionary [
	client queryAddAll: aDictionary
]

{ #category : #accessing }
GtXRPCClient >> server: aString [
	self
		client: (ZnClient new
				url: aString;
				addPath: 'xrpc')
]

{ #category : #accessing }
GtXRPCClient >> setAuthentication: aString [
	self client setBearerAuthentication: aString
]
