Class {
	#name : #LeBlueskyIdentityStore,
	#superclass : #Object,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#instVars : [
		'clients'
	],
	#category : #'Gt4Bluesky-Identity'
}

{ #category : #accessing }
LeBlueskyIdentityStore >> addClient: aClient [
	clients at: aClient handle put: aClient
]

{ #category : #accessing }
LeBlueskyIdentityStore >> existingAccounts [
	^ clients keys
]

{ #category : #accessing }
LeBlueskyIdentityStore >> getClientFor: aKey [
	^ clients at: aKey
]

{ #category : #accessing }
LeBlueskyIdentityStore >> initialize [
	clients := Dictionary new.
]
