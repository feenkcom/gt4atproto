Class {
	#name : #GtApLexiconImage,
	#superclass : #GtApLexiconData,
	#instVars : [
		'maxWidth',
		'maxHeight'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconImage class >> typeName [
	^ #image
]

{ #category : #accessing }
GtApLexiconImage >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconImage: self
]

{ #category : #accessing }
GtApLexiconImage >> maxHeight [
	^ maxHeight
]

{ #category : #accessing }
GtApLexiconImage >> maxHeight: anObject [
	maxHeight := anObject
]

{ #category : #accessing }
GtApLexiconImage >> maxWidth [
	^ maxWidth
]

{ #category : #accessing }
GtApLexiconImage >> maxWidth: anObject [
	maxWidth := anObject
]
