Class {
	#name : #GtApLoginForm,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'server',
		'clientCallback',
		'clientClass'
	],
	#category : #'Gt4AtProto-Magritte'
}

{ #category : #accessing }
GtApLoginForm >> asElement [
	^ self asGtMagritteViewModel asElement
]

{ #category : #accessing }
GtApLoginForm >> buildClient [
	^ self clientClass new
		server: self server;
		loginUser: self username withPass: self password
]

{ #category : #accessing }
GtApLoginForm >> clientCallback [
	^ clientCallback
]

{ #category : #accessing }
GtApLoginForm >> clientCallback: anObject [
	clientCallback := anObject
]

{ #category : #accessing }
GtApLoginForm >> clientClass [
	^ clientClass
]

{ #category : #accessing }
GtApLoginForm >> clientClass: anObject [
	clientClass := anObject
]

{ #category : #accessing }
GtApLoginForm >> defaultServer [
	^ 'https://bsky.social'
]

{ #category : #accessing }
GtApLoginForm >> initialize [
	username := ''.
	password := ''.
	server := self defaultServer.
	clientClass := GtApClient
]

{ #category : #accessing }
GtApLoginForm >> magritteAcceptAction [
	<magritteActionDescription>
	^ super magritteAcceptAction
		onSuccessCallback: (GtMagritteCallback new
				action: [ :aModel :aButton :aMemento :aDescription | 
					self clientCallback
						ifNil: [ aButton phlow spawnObject: self buildClient ]
						ifNotNil: [ :aCallback | aCallback value: self buildClient ] ])
]

{ #category : #accessing }
GtApLoginForm >> password [
	^ password
]

{ #category : #accessing }
GtApLoginForm >> password: anObject [
	password := anObject
]

{ #category : #accessing }
GtApLoginForm >> passwordDescription [
	<magritteDescription>
	
	^ MAPasswordDescription new
		name: 'Password';
		accessor: #password;
		priority: 3
]

{ #category : #accessing }
GtApLoginForm >> server [
	^ server
]

{ #category : #accessing }
GtApLoginForm >> server: anObject [
	server := anObject
]

{ #category : #accessing }
GtApLoginForm >> serverDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		name: 'Server URL';
		accessor: #server;
		priority: 1
]

{ #category : #accessing }
GtApLoginForm >> username [
	^ username
]

{ #category : #accessing }
GtApLoginForm >> username: anObject [
	username := anObject
]

{ #category : #accessing }
GtApLoginForm >> usernameDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		name: 'Username';
		accessor: #username;
		priority: 2
]
