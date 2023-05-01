Class {
	#name : #GtApLexiconObject,
	#superclass : #GtApLexiconCustom,
	#instVars : [
		'required',
		'properties'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconObject >> properties [
	^ properties
]

{ #category : #accessing }
GtApLexiconObject >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
GtApLexiconObject >> required [
	^ required
]

{ #category : #accessing }
GtApLexiconObject >> required: anObject [
	required := anObject
]
