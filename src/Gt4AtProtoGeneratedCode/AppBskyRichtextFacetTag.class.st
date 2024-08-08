Class {
	#name : #AppBskyRichtextFacetTag,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpTag'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetTag class >> atpDescription [
 ^  'Facet feature for a hashtag. The text usually includes a ''#'' prefix, but the facet reference should not (except in the case of ''double hash tags'').'
]

{ #category : #accessing }
AppBskyRichtextFacetTag class >> atpFile [
 ^ 'app/bsky/richtext/facet.json'
]

{ #category : #accessing }
AppBskyRichtextFacetTag class >> atpRecordName [
 ^ 'app.bsky.richtext.facet#tag'
]

{ #category : #accessing }
AppBskyRichtextFacetTag class >> atpSchema [
 ^ '{"type":"object","description":"Facet feature for a hashtag. The text usually includes a ''#'' prefix, but the facet reference should not (except in the case of ''double hash tags'').","required":["tag"],"properties":{"tag":{"type":"string","maxLength":640,"maxGraphemes":64}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetTag class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpTag: (aRequest at: 'tag' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetTag >> atpTag [
	<atpType:#String format:nil>
	^ atpTag
]

{ #category : #accessing }
AppBskyRichtextFacetTag >> atpTag: anObject [
	atpTag := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetTag >> tagDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Tag';
		accessor: #atpTag;
		beRequired
]
