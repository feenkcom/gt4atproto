Class {
	#name : #GtApLexiconDefinition,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconDefinition >> generateGetterAs: aString [
	^ aString
		, '
	^ ', aString
]

{ #category : #accessing }
GtApLexiconDefinition >> generateSetterAs: aString [
	^ aString
		, ': anObject
	', aString, ' := anObject'
]

{ #category : #'gt - extensions' }
GtApLexiconDefinition >> gtJsonObjectFor: aView context: aContext [
	<gtView>
	
	^ aView forward 
		title: 'Raw Data';
		priority: 40;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonObjectFor:context:
]

{ #category : #'gt - extensions' }
GtApLexiconDefinition >> gtJsonStringFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'JSON String';
		priority: 50;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonStringFor:
]

{ #category : #testing }
GtApLexiconDefinition >> isReference [
	^ false
]

{ #category : #accessing }
GtApLexiconDefinition >> isXRPCCall [
	^ false
]

{ #category : #accessing }
GtApLexiconDefinition >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconDefinition >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconDefinition >> referencedDefinitions [
	^ #()
]

{ #category : #accessing }
GtApLexiconDefinition >> type [
	^ self class typeName
]

{ #category : #accessing }
GtApLexiconDefinition >> typeDescription [
	^ self type
]
