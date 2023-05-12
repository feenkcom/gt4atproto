Class {
	#name : #AppBskyRichtextFacetMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpIndex',
		'atpFeatures'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetMain class >> atpRecordName [
 ^ 'app.bsky.richtext.facet'
]

{ #category : #serialization }
AppBskyRichtextFacetMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpIndex: (aRequest at: 'index' ifPresent: [:aValue | AppBskyRichtextFacetByteSlice fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpFeatures: (aRequest at: 'features' ifPresent: [:anArray | anArray collect: [:aValue |Mention. Link fromRequest: aValue ] ] ifAbsent: [ nil ])
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
