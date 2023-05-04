Class {
	#name : #GtApLexiconEntity,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #'gt - extensions' }
GtApLexiconEntity >> gtJsonObjectFor: aView context: aContext [
	<gtView>
	
	^ aView forward 
		title: 'Raw Data';
		priority: 40;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonObjectFor:context:
]

{ #category : #'gt - extensions' }
GtApLexiconEntity >> gtJsonStringFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'JSON String';
		priority: 50;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonStringFor:
]

{ #category : #accessing }
GtApLexiconEntity >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconEntity >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconEntity >> type [
	^ self class typeName
]
