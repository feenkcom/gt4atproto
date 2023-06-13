Class {
	#name : #GtApServer,
	#superclass : #LeBasicServer,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApServer class >> configurationClass [
	^ GtApServerConfiguration
]

{ #category : #accessing }
GtApServer >> defaultDelegate [
	^ GtApRestDelegate new
]

{ #category : #accessing }
GtApServer >> updateAuthenticator [
	self zincServer authenticator: nil
]
