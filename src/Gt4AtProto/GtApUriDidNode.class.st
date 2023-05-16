Class {
	#name : #GtApUriDidNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'methodName',
		'methodSpecificId'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriDidNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDid: self
]

{ #category : #generated }
GtApUriDidNode >> methodName [
	^ methodName
]

{ #category : #generated }
GtApUriDidNode >> methodName: aSmaCCToken [
	methodName := aSmaCCToken
]

{ #category : #generated }
GtApUriDidNode >> methodSpecificId [
	^ methodSpecificId
]

{ #category : #generated }
GtApUriDidNode >> methodSpecificId: aSmaCCToken [
	methodSpecificId := aSmaCCToken
]

{ #category : #generated }
GtApUriDidNode >> tokenVariables [
	^ #(#methodName #methodSpecificId)
]
