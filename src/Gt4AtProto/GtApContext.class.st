Class {
	#name : #GtApContext,
	#superclass : #Object,
	#instVars : [
		'server',
		'handle',
		'loginInformation',
		'requestHistory'
	],
	#category : #Gt4AtProto
}

{ #category : #accessing }
GtApContext >> addRequest: aRequest [
	requestHistory add: aRequest
]

{ #category : #accessing }
GtApContext >> gtRequestHistoryFor: aView [
	<gtView>
	^ aView list
		title: 'Request History';
		priority: 1;
		items: [ self requestHistory ]
]

{ #category : #accessing }
GtApContext >> handle [
	^ handle
]

{ #category : #accessing }
GtApContext >> handle: anObject [
	handle := anObject
]

{ #category : #accessing }
GtApContext >> initialize [
	requestHistory := OrderedCollection new
]

{ #category : #accessing }
GtApContext >> isLoggedIn [
	^ server isNotNil and: [ handle isNotNil and: [ loginInformation isNotNil ] ]
]

{ #category : #accessing }
GtApContext >> jwtAccess [
	^ loginInformation at: 'accessJwt'
]

{ #category : #accessing }
GtApContext >> loginInformation [
	^ loginInformation
]

{ #category : #accessing }
GtApContext >> loginInformation: anObject [
	loginInformation := anObject
]

{ #category : #accessing }
GtApContext >> requestHistory [
	^ requestHistory
]

{ #category : #accessing }
GtApContext >> server [
	^ server
]

{ #category : #accessing }
GtApContext >> server: anObject [
	server := anObject
]
