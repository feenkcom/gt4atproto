Class {
	#name : #GtApLexiconUnknownDefinition,
	#superclass : #GtApLexiconDefinition,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconUnknownDefinition class >> typeName [
	^ #unknown
]

{ #category : #visiting }
GtApLexiconUnknownDefinition >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconUnknownDefinition:  self
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> description [
	^ nil
]
