Class {
	#name : #GtApLexiconVideo,
	#superclass : #GtApLexiconData,
	#instVars : [
		'maxWidth',
		'maxHeight',
		'maxLength'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconVideo class >> typeName [
	^ #video
]

{ #category : #visiting }
GtApLexiconVideo >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconVideo: self
]

{ #category : #accessing }
GtApLexiconVideo >> maxHeight [
	^ maxHeight
]

{ #category : #accessing }
GtApLexiconVideo >> maxHeight: anObject [
	maxHeight := anObject
]

{ #category : #accessing }
GtApLexiconVideo >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconVideo >> maxLength: anObject [
	maxLength := anObject
]

{ #category : #accessing }
GtApLexiconVideo >> maxWidth [
	^ maxWidth
]

{ #category : #accessing }
GtApLexiconVideo >> maxWidth: anObject [
	maxWidth := anObject
]
