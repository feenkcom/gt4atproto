Class {
	#name : #GtApModelEntity,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'targetUrl',
		'loginData'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApModelEntity class >> fromRawData: aDictionary [
	^ self new 
		rawData: aDictionary
]

{ #category : #accessing }
GtApModelEntity >> createClientForId: anId [
	^ GtXRPCClient new 
		server: targetUrl;
		methodId: anId;
		setAuthentication: (loginData at: 'accessJwt').
]

{ #category : #accessing }
GtApModelEntity >> loginData [
	^ loginData
]

{ #category : #accessing }
GtApModelEntity >> loginData: anObject [
	loginData := anObject
]

{ #category : #accessing }
GtApModelEntity >> rawData: aDictionary [ 
	rawData := aDictionary
]

{ #category : #accessing }
GtApModelEntity >> targetUrl [
	^ targetUrl
]

{ #category : #accessing }
GtApModelEntity >> targetUrl: anObject [
	targetUrl := anObject
]
