Class {
	#name : #GtApUriRegNameNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'host'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriRegNameNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRegName: self
]

{ #category : #generated }
GtApUriRegNameNode >> host [
	^ host
]

{ #category : #generated }
GtApUriRegNameNode >> host: aSmaCCToken [
	host := aSmaCCToken
]

{ #category : #generated }
GtApUriRegNameNode >> tokenVariables [
	^ #(#host)
]
