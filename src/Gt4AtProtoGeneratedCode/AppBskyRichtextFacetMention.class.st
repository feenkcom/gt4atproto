Class {
	#name : #AppBskyRichtextFacetMention,
	#superclass : #Object,
	#instVars : [
		'atProtoDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetMention >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
AppBskyRichtextFacetMention >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetMention >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]
