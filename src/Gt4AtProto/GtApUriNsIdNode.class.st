Class {
	#name : #GtApUriNsIdNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriNsIdNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNsId: self
]
