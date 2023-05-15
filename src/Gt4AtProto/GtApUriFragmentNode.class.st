Class {
	#name : #GtApUriFragmentNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriFragmentNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFragment: self
]
