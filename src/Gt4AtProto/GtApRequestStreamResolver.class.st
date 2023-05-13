Class {
	#name : #GtApRequestStreamResolver,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtApRequestStreamResolver >> block [
	^ block
]

{ #category : #accessing }
GtApRequestStreamResolver >> block: anObject [
	block := anObject
]

{ #category : #accessing }
GtApRequestStreamResolver >> value: aStream [
	^ AsyncMapStream mapBlock: self block stream: aStream
]
