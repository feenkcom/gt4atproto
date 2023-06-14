Class {
	#name : #GtApLexiconXrpcBody,
	#superclass : #GtApLexiconXrpcEntity,
	#instVars : [
		'encoding',
		'schema'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #visiting }
GtApLexiconXrpcBody >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconXrpBody: self
]

{ #category : #printing }
GtApLexiconXrpcBody >> descriptionOn: aStream [
	aStream << self encoding
]

{ #category : #accessing }
GtApLexiconXrpcBody >> encoding [
	^ encoding
]

{ #category : #accessing }
GtApLexiconXrpcBody >> encoding: anObject [
	encoding := anObject
]

{ #category : #accessing }
GtApLexiconXrpcBody >> generateDeserialization [
	^ self schema generateDeserialization
]

{ #category : #accessing }
GtApLexiconXrpcBody >> generateJson [
	^ {'encoding' -> self encoding.
		'schema' -> self schema generateJson} asDictionary
]

{ #category : #accessing }
GtApLexiconXrpcBody >> gtViewSchemaPropertiesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Properties';
		priority: 10;
		object: [ schema targetDefinition ];
		view: #gtViewPropertiesFor:  
]

{ #category : #accessing }
GtApLexiconXrpcBody >> schema [
	^ schema ifNil: [ GtApLexiconObject empty ]
]

{ #category : #accessing }
GtApLexiconXrpcBody >> schema: anObject [
	schema := anObject
]
