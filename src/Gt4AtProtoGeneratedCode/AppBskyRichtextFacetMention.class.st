Class {
	#name : #AppBskyRichtextFacetMention,
	#superclass : #Object,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetMention class >> fromRequest: aRequest [
	^ self new atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetMention >> atpDid [
	^ atpDid
]

{ #category : #accessing }
AppBskyRichtextFacetMention >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetMention >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]
