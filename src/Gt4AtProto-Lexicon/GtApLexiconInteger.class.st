Class {
	#name : #GtApLexiconInteger,
	#superclass : #GtApLexiconNumericalPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconInteger class >> typeName [
	^ #integer
]

{ #category : #visiting }
GtApLexiconInteger >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconInteger:  self
]

{ #category : #accessing }
GtApLexiconInteger >> asClassName [
	^ 'Number'
]
