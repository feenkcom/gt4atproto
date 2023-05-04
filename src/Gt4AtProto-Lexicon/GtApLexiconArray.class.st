Class {
	#name : #GtApLexiconArray,
	#superclass : #GtApLexiconEntity,
	#instVars : [
		'items',
		'minLength',
		'maxLength',
		'description'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconArray class >> typeName [
	^ #array
]

{ #category : #accessing }
GtApLexiconArray >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconArray >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApLexiconArray >> items [
	^ items
]

{ #category : #accessing }
GtApLexiconArray >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtApLexiconArray >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconArray >> maxLength: anObject [
	maxLength := anObject
]

{ #category : #accessing }
GtApLexiconArray >> minLength [
	^ minLength
]

{ #category : #accessing }
GtApLexiconArray >> minLength: anObject [
	minLength := anObject
]
