Class {
	#name : #GtApUriNsAuthorityNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'segments'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriNsAuthorityNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNsAuthority: self
]

{ #category : #generated }
GtApUriNsAuthorityNode >> compositeTokenVariables [
	^ #(#segments)
]

{ #category : #'generated-initialize-release' }
GtApUriNsAuthorityNode >> initialize [
	super initialize.
	segments := OrderedCollection new: 2.
]

{ #category : #generated }
GtApUriNsAuthorityNode >> segments [
	^ segments
]

{ #category : #generated }
GtApUriNsAuthorityNode >> segments: anOrderedCollection [
	segments := anOrderedCollection
]
