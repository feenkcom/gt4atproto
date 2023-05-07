Class {
	#name : #GtApLexiconToken,
	#superclass : #GtApLexiconCustomDefinition,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconToken class >> typeName [
	^ #token
]

{ #category : #accessing }
GtApLexiconToken >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconToken:  self
]
