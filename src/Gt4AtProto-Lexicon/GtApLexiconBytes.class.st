Class {
	#name : #GtApLexiconBytes,
	#superclass : #GtApLexiconCustom,
	#instVars : [
		'maxLength'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconBytes class >> typeName [
	^ #bytes
]

{ #category : #accessing }
GtApLexiconBytes >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconBytes >> maxLength: anObject [
	maxLength := anObject
]
