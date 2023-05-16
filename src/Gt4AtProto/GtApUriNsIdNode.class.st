Class {
	#name : #GtApUriNsIdNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'segment',
		'child'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriNsIdNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNsId: self
]

{ #category : #generated }
GtApUriNsIdNode >> child [
	^ child
]

{ #category : #generated }
GtApUriNsIdNode >> child: aGtApUriNsIdNode [
	self child notNil ifTrue: [ self child parent: nil ].
	child := aGtApUriNsIdNode.
	self child notNil ifTrue: [ self child parent: self ]
]

{ #category : #generated }
GtApUriNsIdNode >> nodeVariables [
	^ #(#child #authority #path)
]

{ #category : #generated }
GtApUriNsIdNode >> segment [
	^ segment
]

{ #category : #generated }
GtApUriNsIdNode >> segment: aSmaCCToken [
	segment := aSmaCCToken
]

{ #category : #generated }
GtApUriNsIdNode >> tokenVariables [
	^ #(#segment)
]
