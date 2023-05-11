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

{ #category : #visiting }
GtApLexiconRecord >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconRecord:  self
]

{ #category : #accessing }
GtApLexiconRecord >> asObject [
	^ self record
]

{ #category : #'gt - extensions' }
GtApLexiconRecord >> gtViewRecordPropertiesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Properties';
		priority: 10;
		object: [ record ];
		view: #gtViewPropertiesFor:  
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
GtApLexiconRecord >> properties [
	^ record properties
]

{ #category : #accessing }
GtApLexiconRecord >> record [
	^ record
]

{ #category : #accessing }
GtApLexiconRecord >> record: anObject [
	record := anObject
]

{ #category : #accessing }
GtApLexiconRecord >> referencedDefinitions [
	^ { record } 
]
