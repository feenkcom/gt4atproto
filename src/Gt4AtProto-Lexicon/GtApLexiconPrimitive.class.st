Class {
	#name : #GtApLexiconPrimitive,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'description'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconPrimitive >> buildFromRequestOn: aKey [
	^ aKey
]

{ #category : #accessing }
GtApLexiconPrimitive >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey , ''' ifAbsent: [ nil ]'
]

{ #category : #accessing }
GtApLexiconPrimitive >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconPrimitive >> description: anObject [
	description := anObject
]
