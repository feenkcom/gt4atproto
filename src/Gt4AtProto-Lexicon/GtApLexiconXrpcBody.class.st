Class {
	#name : #GtApLexiconXrpcBody,
	#superclass : #GtApLexiconXrpcEntity,
	#instVars : [
		'encoding',
		'schema'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconXrpcBody >> encoding [
	^ encoding
]

{ #category : #accessing }
GtApLexiconXrpcBody >> encoding: anObject [
	encoding := anObject
]

{ #category : #accessing }
GtApLexiconXrpcBody >> schema [
	^ schema
]

{ #category : #accessing }
GtApLexiconXrpcBody >> schema: anObject [
	schema := anObject
]
