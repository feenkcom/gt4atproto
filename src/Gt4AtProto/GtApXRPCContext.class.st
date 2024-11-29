Class {
	#name : #GtApXRPCContext,
	#superclass : #Object,
	#instVars : [
		'server',
		'loginInformation',
		'requestHistory'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtApXRPCContext >> addRequest: aRequest [
	requestHistory add: aRequest
]

{ #category : #accessing }
GtApXRPCContext >> gtRequestHistoryFor: aView [
	<gtView>
	^ aView list
		title: 'Request history';
		priority: 10;
		items: [ self requestHistory ]
]

{ #category : #accessing }
GtApXRPCContext >> handle [
	^ loginInformation handle
]

{ #category : #accessing }
GtApXRPCContext >> initialize [
	requestHistory := OrderedCollection new
]

{ #category : #accessing }
GtApXRPCContext >> isLoggedIn [
	^ server isNotNil and: [ loginInformation isNotNil ]
]

{ #category : #accessing }
GtApXRPCContext >> jwtAccess [
	^ loginInformation accessToken
]

{ #category : #accessing }
GtApXRPCContext >> jwtRefresh [
	^ loginInformation refreshToken
]

{ #category : #accessing }
GtApXRPCContext >> loginInformation: anObject for: aUserNameString [
	loginInformation := GtBlueskyIdentity new
			accessToken: (anObject at: 'accessJwt');
			refreshToken: (anObject at: 'refreshJwt');
			handle: aUserNameString.

	(GtIdentityRegistry registry allOfType: GtBlueskyIdentity)
		do: [ :anIdentity | 
			anIdentity handle = aUserNameString
				ifTrue: [ GtIdentityRegistry registry removeCredential: anIdentity ] ].

	GtIdentityRegistry registry
		addCredential: loginInformation;
		saveCredentials
]

{ #category : #accessing }
GtApXRPCContext >> loginInformationRaw: anIdentity [
	loginInformation := anIdentity
]

{ #category : #accessing }
GtApXRPCContext >> replaceLoginInformation: anObject [
	GtIdentityRegistry registry removeCredential: loginInformation.

	loginInformation := GtBlueskyIdentity new
			accessToken: (anObject at: 'accessJwt');
			refreshToken: (anObject at: 'refreshJwt');
			handle: loginInformation handle.

	GtIdentityRegistry registry
		addCredential: loginInformation;
		saveCredentials
]

{ #category : #accessing }
GtApXRPCContext >> requestHistory [
	^ requestHistory
]

{ #category : #accessing }
GtApXRPCContext >> server [
	^ server
]

{ #category : #accessing }
GtApXRPCContext >> server: anObject [
	server := anObject
]
