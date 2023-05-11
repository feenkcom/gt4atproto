Class {
	#name : #AppBskyRichtextFacetMain,
	#superclass : #Object,
	#instVars : [
		'atProtoIndex',
		'atProtoFeatures'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetMain class >> fromRequest: aRequest [
	^ self new atProtoIndex: (AppBskyRichtextFacetByteSlice fromRequest: (aRequest at: 'index' ifAbsent: [ nil ])); 
		atProtoFeatures: (aRequest at: 'features' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atProtoFeatures [
	^ atProtoFeatures
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atProtoFeatures: anObject [
	atProtoFeatures := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atProtoIndex [
	<referenceTo:'#byteSlice'>
	^ atProtoIndex
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atProtoIndex: anObject [
	<referenceTo:'#byteSlice'>
	atProtoIndex := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetMain >> featuresDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Mention. Link};
		label: 'Features';
		accessor: #atProtoFeatures;
	beRequired
]

{ #category : #magritte }
AppBskyRichtextFacetMain >> indexDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Index';
		accessor: #atProtoIndex;
		beRequired
]
