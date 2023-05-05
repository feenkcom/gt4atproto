Class {
	#name : #GtApLexiconAudio,
	#superclass : #GtApLexiconData,
	#instVars : [
		'maxLength'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconAudio class >> typeName [
	^ #audio
]

{ #category : #accessing }
GtApLexiconAudio >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconAudio >> maxLength: anObject [
	maxLength := anObject
]
