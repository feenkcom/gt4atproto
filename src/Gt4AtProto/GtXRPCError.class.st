Class {
	#name : #GtXRPCError,
	#superclass : #Error,
	#instVars : [
		'errorMessage'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtXRPCError >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtXRPCError >> errorMessage: anObject [
	errorMessage := anObject
]
