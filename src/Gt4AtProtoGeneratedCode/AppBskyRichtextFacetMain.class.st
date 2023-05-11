Class {
	#name : #AppBskyRichtextFacetMain,
	#superclass : #Object,
	#instVars : [
		'atpIndex',
		'atpFeatures'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetMain class >> fromRequest: aRequest [
	^ self new atpIndex: (aRequest at: 'index' ifPresent: [:aValue | AppBskyRichtextFacetByteSlice fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpFeatures: (aRequest at: 'features' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpFeatures [
	^ atpFeatures
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpFeatures: anObject [
	atpFeatures := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpIndex [
	<referenceTo:'#byteSlice'>
	^ atpIndex
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpIndex: anObject [
	<referenceTo:'#byteSlice'>
	atpIndex := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetMain >> featuresDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Mention. Link};
		label: 'Features';
		accessor: #atpFeatures;
	beRequired
]

{ #category : #magritte }
AppBskyRichtextFacetMain >> indexDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Index';
		accessor: #atpIndex;
		beRequired
]
