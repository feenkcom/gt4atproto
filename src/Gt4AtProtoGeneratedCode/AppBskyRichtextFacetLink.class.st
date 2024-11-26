Class {
	#name : #AppBskyRichtextFacetLink,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyRichtextFacetLink',
	#classTraits : 'TAppBskyRichtextFacetLink classTrait',
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetLink class >> atpDescription [
 ^  'Facet feature for a URL. The text URL may have been simplified or truncated, but the facet reference should be a complete URL.'
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
 ^ '{"type":"object","description":"Facet feature for a URL. The text URL may have been simplified or truncated, but the facet reference should be a complete URL.","required":["uri"],"properties":{"uri":{"type":"string","format":"uri"}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetLink class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetLink >> atpUri [
	<atpType:#String format:'uri'>
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
