Class {
	#name : #GtXRPCClient,
	#superclass : #Object,
	#instVars : [
		'client',
		'methodId',
		'request',
		'response'
	],
	#category : #'Gt4AtProto-XRPC'
}

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
	^ STONJSON fromString: response
]

{ #category : #accessing }
GtXRPCClient >> query [
	request := self client request.
	response := self client get.
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
