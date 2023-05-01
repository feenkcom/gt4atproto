Class {
	#name : #GtApLexiconDocument,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'lexicon',
		'id',
		'revision',
		'description',
		'definitions'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconDocument >> definitions [
	^ definitions
]

{ #category : #accessing }
GtApLexiconDocument >> definitions: anObject [
	definitions := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconDocument >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconDocument >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> lexicon [
	^ lexicon
]

{ #category : #accessing }
GtApLexiconDocument >> lexicon: anObject [
	lexicon := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> revision [
	^ revision
]

{ #category : #accessing }
GtApLexiconDocument >> revision: anObject [
	revision := anObject
]
