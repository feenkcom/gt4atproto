Class {
	#name : #AppBskyRichtextFacetLink,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetLink class >> atpDescription [
 ^ 'A facet feature for links.'
]

{ #category : #accessing }
AppBskyRichtextFacetLink class >> atpFile [
 ^ 'app/bsky/richtext/facet.json'
]

{ #category : #accessing }
AppBskyRichtextFacetLink class >> atpRecordName [
 ^ 'app.bsky.richtext.facet#link'
]

{ #category : #accessing }
AppBskyRichtextFacetLink class >> atpSchema [
 ^ '{"type":"object","description":"A facet feature for links.","required":["uri"],"properties":{"uri":{"type":"string","format":"uri"}}}'
]

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
