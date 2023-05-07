Class {
	#name : #GtApLexiconNumber,
	#superclass : #GtApLexiconNumericalPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconNumber class >> typeName [
	^ #number
]

{ #category : #visiting }
GtApLexiconNumber >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconNumber:  self
]
