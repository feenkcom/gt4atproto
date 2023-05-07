Class {
	#name : #GtApLexiconCustomDefinition,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'description',
		'id'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconCustomDefinition >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconCustomDefinition >> description: anObject [
	description := anObject
]

{ #category : #printing }
GtApLexiconCustomDefinition >> descriptionOn: aStream [
	
	self id ifNotNil: [
		aStream << self id ]
]

{ #category : #accessing }
GtApLexiconCustomDefinition >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconCustomDefinition >> id: anObject [
	id := anObject
]
