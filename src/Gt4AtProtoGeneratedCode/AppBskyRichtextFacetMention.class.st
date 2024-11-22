Class {
	#name : #AppBskyRichtextFacetMention,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyRichtextFacetMention',
	#classTraits : 'TAppBskyRichtextFacetMention classTrait',
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpDescription [
 ^  'Facet feature for mention of another account. The text is usually a handle, including a ''@'' prefix, but the facet reference is a DID.'
]

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpFile [
 ^ 'app/bsky/richtext/facet.json'
]

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpRecordName [
 ^ 'app.bsky.richtext.facet#mention'
]

{ #category : #accessing }
AppBskyRichtextFacetMention class >> atpSchema [
 ^ '{"type":"object","description":"Facet feature for mention of another account. The text is usually a handle, including a ''@'' prefix, but the facet reference is a DID.","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetMention class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetMention >> atpDid [
	<atpType:#String format:'did'>
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
