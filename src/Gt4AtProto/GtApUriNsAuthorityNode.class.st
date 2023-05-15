Class {
	#name : #GtApUriNsAuthorityNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriNsAuthorityNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNsAuthority: self
]
