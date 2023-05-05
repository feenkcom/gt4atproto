Class {
	#name : #GtApLexiconInteger,
	#superclass : #GtApLexiconNumericalPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconInteger class >> typeName [
	^ #integer
]

{ #category : #accessing }
GtApLexiconInteger >> asClassName [
	^ 'Number'
]
