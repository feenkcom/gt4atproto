Class {
	#name : #GtApLexiconReference,
	#superclass : #Object,
	#instVars : [
		'referenceString',
		'referencedEntity'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #printing }
GtApLexiconReference >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self referenceString]
]

{ #category : #accessing }
GtApLexiconReference >> referenceString [
	^ referenceString
]

{ #category : #accessing }
GtApLexiconReference >> referenceString: anObject [
	referenceString := anObject
]
