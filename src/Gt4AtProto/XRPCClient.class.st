Class {
	#name : #XRPCClient,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
XRPCClient >> body: aString [
	self client
		contents: aString;
		contentType: ZnMimeType applicationJson
]

{ #category : #accessing }
XRPCClient >> client [
	^ client
]

{ #category : #accessing }
XRPCClient >> client: anObject [
	client := anObject
]

{ #category : #accessing }
XRPCClient >> methodId: aString [
	self client addPath: aString
]

{ #category : #accessing }
XRPCClient >> parameters: aDictionary [
	self client queryAddAll: aDictionary
]

{ #category : #accessing }
XRPCClient >> procedure [
	^ STONJSON fromString: self client post
]

{ #category : #accessing }
XRPCClient >> query [
	^ STONJSON fromString: self client get
]

{ #category : #accessing }
XRPCClient >> server: aString [
	self
		client: (ZnClient new
				url: aString;
				addPath: 'xrpc')
]

{ #category : #accessing }
XRPCClient >> setAuthentication: aString [
	self client setBearerAuthentication: aString
]
