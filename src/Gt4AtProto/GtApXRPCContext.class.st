Class {
	#name : #GtApXRPCContext,
	#superclass : #Object,
	#instVars : [
		'server',
		'handle',
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
	^ handle
]

{ #category : #accessing }
GtApXRPCContext >> handle: anObject [
	handle := anObject
]

{ #category : #accessing }
GtApXRPCContext >> initialize [
	requestHistory := OrderedCollection new
]

{ #category : #accessing }
GtApXRPCContext >> isLoggedIn [
	^ server isNotNil and: [ handle isNotNil and: [ loginInformation isNotNil ] ]
]

{ #category : #accessing }
GtApXRPCContext >> jwtAccess [
	^ loginInformation at: 'accessJwt'
]

{ #category : #accessing }
GtApXRPCContext >> jwtRefresh [
	^ loginInformation at: 'refreshJwt'
]

{ #category : #accessing }
GtApXRPCContext >> loginInformation [
	^ loginInformation
]

{ #category : #accessing }
GtApXRPCContext >> loginInformation: anObject [
	loginInformation := anObject
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
