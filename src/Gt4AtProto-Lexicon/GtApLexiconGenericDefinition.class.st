Class {
	#name : #GtApLexiconGenericDefinition,
	#superclass : #Object,
	#instVars : [
		'type',
		'rawData',
		'attributes'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconGenericDefinition >> attributes [
	^ attributes
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> description [
	^ self attributes 
		at: #description
		ifAbsent: [ nil ]
]

{ #category : #'gt - extensions' }
GtApLexiconGenericDefinition >> gtJsonObjectFor: aView context: aContext [
	<gtView>
	
	^ aView forward 
		title: 'Raw Data';
		priority: 40;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonObjectFor:context:
]

{ #category : #'gt - extensions' }
GtApLexiconGenericDefinition >> gtJsonStringFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'JSON String';
		priority: 50;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonStringFor:
]

{ #category : #'gt - extensions' }
GtApLexiconGenericDefinition >> gtViewAttributesFor: aView [
	<gtView>
	^ aView forward 
		title: 'Attributes';
		priority: 20;
		object: [ self attributes];
		view: #gtItemsFor: 
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self type]
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> type [
	^ type
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> type: anObject [
	type := anObject
]
