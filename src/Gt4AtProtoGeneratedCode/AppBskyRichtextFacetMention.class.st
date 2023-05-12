Class {
	#name : #AppBskyRichtextFacetMention,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpDescription [
 ^ 'A facet feature for actor mentions.'
]

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpRecordName [
 ^ 'app.bsky.richtext.facet#mention'
]

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpSchema [
 ^ '{"type":"object","description":"A facet feature for actor mentions.","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetMention class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
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
