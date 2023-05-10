Class {
	#name : #AppBskyRichtextFacetLink,
	#superclass : #Object,
	#instVars : [
		'atProtoUri'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyRichtextFacetLink >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyRichtextFacetLink >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetLink >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
