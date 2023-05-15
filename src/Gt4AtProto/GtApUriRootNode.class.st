Class {
	#name : #GtApUriRootNode,
	#superclass : #SmaCCParseNode,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriRootNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRoot: self
]
