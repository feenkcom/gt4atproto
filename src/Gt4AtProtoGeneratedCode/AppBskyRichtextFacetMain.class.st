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
AppBskyRichtextFacetMain class >> atpDescription [
 ^  'Annotation of a sub-string within rich text.'
]

{ #category : #accessing }
AppBskyRichtextFacetMain class >> atpFile [
 ^ 'app/bsky/richtext/facet.json'
]

{ #category : #accessing }
AppBskyRichtextFacetMain class >> atpRecordName [
 ^ 'app.bsky.richtext.facet'
]

{ #category : #accessing }
AppBskyRichtextFacetMain class >> atpSchema [
 ^ '{"type":"object","description":"Annotation of a sub-string within rich text.","required":["index","features"],"properties":{"index":{"type":"ref","ref":"#byteSlice"},"features":{"type":"array","items":{"type":"union","refs":["#mention","#link","#tag"]}}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpIndex: (aRequest
				at: 'index'
				ifPresent: [ :aValue | AppBskyRichtextFacetByteSlice fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpFeatures: (aRequest
				at: 'features'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | 
							({'app.bsky.richtext.facet#mention' -> AppBskyRichtextFacetMention.
								'app.bsky.richtext.facet#link' -> AppBskyRichtextFacetLink.
								'app.bsky.richtext.facet#tag' -> AppBskyRichtextFacetTag} asDictionary
								at: (aValue at: '$type')) fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpFeatures [
	<atpType:#(AppBskyRichtextFacetMention AppBskyRichtextFacetLink AppBskyRichtextFacetTag) format:nil>
	<atpCollection>
	^ atpFeatures
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpFeatures: anObject [
	atpFeatures := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetMain >> atpIndex [
	<referenceTo:'#byteSlice'>
	<atpType:#AppBskyRichtextFacetByteSlice format:nil>
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
		classes: {AppBskyRichtextFacetMention AppBskyRichtextFacetLink AppBskyRichtextFacetTag};
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
