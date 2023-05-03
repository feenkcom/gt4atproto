Class {
	#name : #GtApLexiconObject,
	#superclass : #GtApLexiconCustom,
	#instVars : [
		'required',
		'properties'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #'instance creation' }
GtApLexiconObject class >> from: aDefinition [
	^ self new
		properties: (aDefinition attributes at: #properties);
		required: (aDefinition attributes at: #required)
]

{ #category : #accessing }
GtApLexiconObject >> isRequired: anId [
	^ required isNotNil and: [ required includes: anId ]
]

{ #category : #accessing }
GtApLexiconObject >> magritteDescription [
	| basicDescription |
	basicDescription := GtApMagritteBuilder for: self.

	^ basicDescription
]

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
