Class {
	#name : #GtApLexiconUnion,
	#superclass : #GtApLexiconEntity,
	#instVars : [
		'refs'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconUnion class >> typeName [
	^ #union
]

{ #category : #accessing }
GtApLexiconUnion >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconUnion >> refs [
	^ refs
]

{ #category : #accessing }
GtApLexiconUnion >> refs: anObject [
	refs := anObject
]
