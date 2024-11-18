Class {
	#name : #GtBlueskyIdentity,
	#superclass : #GtIdentity,
	#instVars : [
		'refreshToken',
		'accessToken',
		'handle'
	],
	#category : #'Gt4Bluesky-Identity'
}

{ #category : #accessing }
GtBlueskyIdentity class >> identityName [
	^ 'com.gamoroustoolkit.bluesky'
]

{ #category : #accessing }
GtBlueskyIdentity class >> jsonProperties [
	^ { #accessToken -> #accessToken.
		#refreshToken -> #refreshToken.
		#handle -> #handle} asDictionary
]

{ #category : #accessing }
GtBlueskyIdentity >> accessToken [
	^ accessToken
]

{ #category : #accessing }
GtBlueskyIdentity >> accessToken: anObject [
	accessToken := anObject
]

{ #category : #accessing }
GtBlueskyIdentity >> createClient [
	| client |
	client := GtApGeneratedClient new
			server: 'https://bsky.social';
			loginInformation: self.

	client verify ifFalse: [ ^ nil ].

	^ client
]

{ #category : #accessing }
GtBlueskyIdentity >> handle [
	^ handle
]

{ #category : #accessing }
GtBlueskyIdentity >> handle: anObject [
	handle := anObject
]

{ #category : #accessing }
GtBlueskyIdentity >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream nextPutAll: self handle
	]
]

{ #category : #accessing }
GtBlueskyIdentity >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
GtBlueskyIdentity >> refreshToken: anObject [
	refreshToken := anObject
]
