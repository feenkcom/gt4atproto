Class {
	#name : #GtApLexiconUnion,
	#superclass : #GtApLexiconEntity,
	#instVars : [
		'refs',
		'resolvedDefinitions'
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

{ #category : #testing }
GtApLexiconUnion >> isReference [
	^ true
]

{ #category : #accessing }
GtApLexiconUnion >> refs [
	^ refs
]

{ #category : #accessing }
GtApLexiconUnion >> refs: anObject [
	refs := anObject
]

{ #category : #'as yet unclassified' }
GtApLexiconUnion >> resolveContainedReferenceUsing: aBlock [ 
	resolvedDefinitions := self refs collect: [ :aReferenceId |
		aBlock value: aReferenceId]
]

{ #category : #accessing }
GtApLexiconUnion >> resolvedDefinitions [
	^ resolvedDefinitions
]

{ #category : #accessing }
GtApLexiconUnion >> typeDescription [
	^ String streamContents: [:s | 
		s << 'union('.
		self refs asStringOn: s delimiter: '|'.
		s << ')']
]
