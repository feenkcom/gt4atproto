Class {
	#name : #GtApLexiconRecord,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'key',
		'record'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconRecord class >> typeName [
	^ #record
]

{ #category : #accessing }
GtApLexiconRecord >> key [
	^ key
]

{ #category : #accessing }
GtApLexiconRecord >> key: anObject [
	key := anObject
]

{ #category : #accessing }
GtApLexiconRecord >> record [
	^ record
]

{ #category : #accessing }
GtApLexiconRecord >> record: anObject [
	record := anObject
]
