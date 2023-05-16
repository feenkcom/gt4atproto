Class {
	#name : #GtApUriPathNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'id',
		'recordId'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriPathNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitPath: self
]

{ #category : #generated }
GtApUriPathNode >> id [
	^ id
]

{ #category : #generated }
GtApUriPathNode >> id: aGtApUriNsIdNode [
	self id notNil ifTrue: [ self id parent: nil ].
	id := aGtApUriNsIdNode.
	self id notNil ifTrue: [ self id parent: self ]
]

{ #category : #generated }
GtApUriPathNode >> nodeVariables [
	^ #(#id #authority #path)
]

{ #category : #generated }
GtApUriPathNode >> recordId [
	^ recordId
]

{ #category : #generated }
GtApUriPathNode >> recordId: aSmaCCToken [
	recordId := aSmaCCToken
]

{ #category : #generated }
GtApUriPathNode >> tokenVariables [
	^ #(#recordId)
]
