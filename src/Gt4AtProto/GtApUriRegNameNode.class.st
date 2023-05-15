Class {
	#name : #GtApUriRegNameNode,
	#superclass : #GtApUriRootNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriRegNameNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRegName: self
]
