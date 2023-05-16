Class {
	#name : #GtApUriNsIdNode,
	#superclass : #GtApUriRootNode,
	#instVars : [
		'segments'
	],
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriNsIdNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNsId: self
]

{ #category : #generated }
GtApUriNsIdNode >> compositeTokenVariables [
	^ #(#segments)
]

{ #category : #'generated-initialize-release' }
GtApUriNsIdNode >> initialize [
	super initialize.
	segments := OrderedCollection new: 2.
]

{ #category : #generated }
GtApUriNsIdNode >> segments [
	^ segments
]

{ #category : #generated }
GtApUriNsIdNode >> segments: anOrderedCollection [
	segments := anOrderedCollection
]
