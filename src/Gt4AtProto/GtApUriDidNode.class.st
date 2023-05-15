Class {
	#name : #GtApUriDidNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriDidNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDid: self
]
