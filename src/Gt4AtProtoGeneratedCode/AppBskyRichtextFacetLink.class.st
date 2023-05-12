Class {
	#name : #AppBskyRichtextFacetLink,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetLink class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetLink >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyRichtextFacetLink >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetLink >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
