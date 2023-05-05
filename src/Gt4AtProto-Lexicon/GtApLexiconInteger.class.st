Class {
	#name : #GtApLexiconInteger,
	#superclass : #GtApLexiconNumericalPrimitive,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconInteger class >> typeName [
	^ #integer
]

{ #category : #accessing }
GtApLexiconInteger >> asClassName [
	^ 'Number'
]
