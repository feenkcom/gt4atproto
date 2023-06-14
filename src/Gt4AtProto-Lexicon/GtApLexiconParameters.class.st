Class {
	#name : #GtApLexiconParameters,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'properties',
		'required'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconParameters class >> typeName [
	^ #params
]

{ #category : #visiting }
GtApLexiconParameters >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconParameters:  self
]

{ #category : #accessing }
GtApLexiconParameters >> generateJson [
	^ {
		'properties' -> self properties.
		'required' -> self required.
	} asDictionary
]

{ #category : #accessing }
GtApLexiconParameters >> gtViewPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 10;
		items: [ self properties associations ];
		column: 'Property'
			text: [ :assoc | 
				(self isPropertyRequired: assoc key)
					ifTrue: [ assoc key asRopedText bold ]
					ifFalse: [ assoc key ] ];
		column: 'Required'
			text: [ :assoc | (self isPropertyRequired: assoc key) 
				ifTrue: [ 'yes' ] 
				ifFalse: [ '' ] ]
			width: 100;
		column: 'Type' text: [ :assoc | assoc value type ];
		column: 'Description'
			text: [ :assoc | assoc value description ifNil: [ '' ] ];
		send: #value
]

{ #category : #testing }
GtApLexiconParameters >> isPropertyRequired: aPropertyName [
	^ required isNotNil and: [ required includes: aPropertyName ]
]

{ #category : #accessing }
GtApLexiconParameters >> properties [
	^ properties
]

{ #category : #accessing }
GtApLexiconParameters >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
GtApLexiconParameters >> required [
	^ required
]

{ #category : #accessing }
GtApLexiconParameters >> required: anObject [
	required := anObject
]
