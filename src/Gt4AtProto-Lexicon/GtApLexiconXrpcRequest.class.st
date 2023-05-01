Class {
	#name : #GtApLexiconXrpcRequest,
	#superclass : #GtApLexiconXrpcEntity,
	#instVars : [
		'parameters',
		'output',
		'errors'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconXrpcRequest >> errors [
	^ errors
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> errors: anObject [
	errors := anObject
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> output [
	^ output
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> output: anObject [
	output := anObject
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> parameters [
	^ parameters
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> parameters: anObject [
	parameters := anObject
]
