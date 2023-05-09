Class {
	#name : #GtApContext,
	#superclass : #Object,
	#instVars : [
		'server',
		'handle',
		'loginInformation',
		'clients'
	],
	#category : #Gt4AtProto
}

{ #category : #accessing }
GtApContext >> addClient: aClient [
	clients add: aClient
]

{ #category : #accessing }
GtApContext >> clients [
	^ clients
]

{ #category : #accessing }
GtApContext >> clients: anObject [
	clients := anObject
]

{ #category : #accessing }
GtApContext >> gtClientHistoryFor: aView [
	<gtView>
	^ aView list
		title: 'Client History';
		priority: 1;
		items: [ self clients ]
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
	clients := OrderedCollection new
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
GtApContext >> server [
	^ server
]

{ #category : #accessing }
GtApContext >> server: anObject [
	server := anObject
]
