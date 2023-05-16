Class {
	#name : #GtApUriRootNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'authority',
		'path',
		'fragment'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriRootNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRoot: self
]

{ #category : #generated }
GtApUriRootNode >> authority [
	^ authority
]

{ #category : #generated }
GtApUriRootNode >> authority: aGtApUriRootNode [
	self authority notNil ifTrue: [ self authority parent: nil ].
	authority := aGtApUriRootNode.
	self authority notNil ifTrue: [ self authority parent: self ]
]

{ #category : #generated }
GtApUriRootNode >> fragment [
	^ fragment
]

{ #category : #generated }
GtApUriRootNode >> fragment: anObject [
	self setParent: self fragment to: nil.
	fragment := anObject.
	self setParent: self fragment to: self
]

{ #category : #generated }
GtApUriRootNode >> nodeVariables [
	^ #(#authority #path)
]

{ #category : #generated }
GtApUriRootNode >> otherVariables [
	^ #(#fragment)
]

{ #category : #generated }
GtApUriRootNode >> path [
	^ path
]

{ #category : #generated }
GtApUriRootNode >> path: aGtApUriPathNode [
	self path notNil ifTrue: [ self path parent: nil ].
	path := aGtApUriPathNode.
	self path notNil ifTrue: [ self path parent: self ]
]
