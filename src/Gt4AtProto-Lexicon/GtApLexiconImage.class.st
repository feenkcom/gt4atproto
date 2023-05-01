Class {
	#name : #GtApLexiconImage,
	#superclass : #GtApLexiconData,
	#instVars : [
		'maxWidth',
		'maxHeight'
	],
	#category : #'Gt4AtProto-Lexicon'
}

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
