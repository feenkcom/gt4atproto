Class {
	#name : #ATPClient,
	#superclass : #Object,
	#instVars : [
		'jwtAccess',
		'server'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
ATPClient class >> onServer: aUrl [
	^ self new server: aUrl
]

{ #category : #accessing }
ATPClient >> clientFor: aMethodId [
	| client |
	client := XRPCClient new
			server: self server;
			methodId: aMethodId.
			
	self isLoggedIn ifTrue: [
		client setAuthentication: jwtAccess.
	].
	
	^ client
]

{ #category : #accessing }
ATPClient >> clientFor: aMethodId body: aBody [
	^ (self clientFor: aMethodId) body: aBody
]

{ #category : #accessing }
ATPClient >> clientFor: aMethodId parameters: aDictionary [
	^ (self clientFor: aMethodId) parameters: aDictionary
]

{ #category : #accessing }
ATPClient >> isLoggedIn [
	^ jwtAccess isNotNil
]

{ #category : #accessing }
ATPClient >> loginUser: aUserNameString withPass: aPasswordString [
	| result |
	result := self
			procedureOn: 'com.atproto.server.createSession'
			withBody: {'identifier' -> aUserNameString.
							'password' -> aPasswordString} asDictionary.

	jwtAccess := result at: 'accessJwt'
]

{ #category : #accessing }
ATPClient >> procedureOn: aMethodId withBody: aBodyDictionary [
	^ (self clientFor: aMethodId body: (STONJSON toString: aBodyDictionary))
		procedure
]

{ #category : #accessing }
ATPClient >> queryOn: aMethodId [
	| res |
	res := (self clientFor: aMethodId) query.

	(res includesKey: 'cursor') ifFalse: [ ^ res ].

	^ ATPResultStream new
		result: res;
		method: aMethodId;
		client: self
]

{ #category : #accessing }
ATPClient >> server [
	^ server
]

{ #category : #accessing }
ATPClient >> server: anObject [
	server := anObject
]
