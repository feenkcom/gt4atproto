Class {
	#name : #ChatBskyConvoDefsMessageInput,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpText',
		'atpFacets',
		'atpEmbed'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsMessageInput class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#messageInput'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput class >> atpSchema [
 ^ '{"type":"object","required":["text"],"properties":{"text":{"type":"string","maxLength":10000,"maxGraphemes":1000},"facets":{"type":"array","description":"Annotations of text (mentions, URLs, hashtags, etc)","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"embed":{"type":"union","refs":["app.bsky.embed.record"]}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsMessageInput class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpText: (aRequest at: 'text' ifAbsent: [ nil ]);
		atpFacets: (aRequest
				at: 'facets'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpEmbed: (aRequest
				at: 'embed'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.record' -> AppBskyEmbedRecordMain} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpEmbed [
	<atpType:#(AppBskyEmbedRecordMain) format:nil>
	^ atpEmbed
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpFacets
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpFacets: anObject [
	atpFacets := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpText [
	<atpType:#String format:nil>
	^ atpText
]

{ #category : #accessing }
ChatBskyConvoDefsMessageInput >> atpText: anObject [
	atpText := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsMessageInput >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.record'};
		label: 'Embed';
		accessor: #atpEmbed
]

{ #category : #magritte }
ChatBskyConvoDefsMessageInput >> facetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'Facets';
		accessor: #atpFacets
]

{ #category : #magritte }
ChatBskyConvoDefsMessageInput >> textDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Text';
		accessor: #atpText;
		beRequired
]
