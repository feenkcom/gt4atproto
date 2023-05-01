Class {
	#name : #GtApLexiconData,
	#superclass : #GtApLexiconCustom,
	#instVars : [
		'accept',
		'maxSize'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconData >> accept [
	^ accept
]

{ #category : #accessing }
GtApLexiconData >> accept: anObject [
	accept := anObject
]

{ #category : #accessing }
GtApLexiconData >> maxSize [
	^ maxSize
]

{ #category : #accessing }
GtApLexiconData >> maxSize: anObject [
	maxSize := anObject
]
