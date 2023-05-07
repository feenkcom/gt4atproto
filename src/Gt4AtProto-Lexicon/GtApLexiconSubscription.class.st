Class {
	#name : #GtApLexiconSubscription,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'parameters',
		'message',
		'errors'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconSubscription class >> typeName [
	^ #subscription
]

{ #category : #accessing }
GtApLexiconSubscription >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconSubscription:  self
]

{ #category : #accessing }
GtApLexiconSubscription >> errors [
	^ errors
]

{ #category : #accessing }
GtApLexiconSubscription >> errors: anObject [
	errors := anObject
]

{ #category : #accessing }
GtApLexiconSubscription >> message [
	^ message
]

{ #category : #accessing }
GtApLexiconSubscription >> message: anObject [
	message := anObject
]

{ #category : #accessing }
GtApLexiconSubscription >> parameters [
	^ parameters
]

{ #category : #accessing }
GtApLexiconSubscription >> parameters: anObject [
	parameters := anObject
]
