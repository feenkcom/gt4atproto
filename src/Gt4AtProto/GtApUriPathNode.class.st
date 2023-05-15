Class {
	#name : #GtApUriPathNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriPathNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitPath: self
]
