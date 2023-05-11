Class {
	#name : #AppBskyFeedPostMain,
	#superclass : #Object,
	#instVars : [
		'atpText',
		'atpEntities',
		'atpFacets',
		'atpReply',
		'atpEmbed',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostMain class >> fromRequest: aRequest [
	^ self new atpText: (aRequest at: 'text' ifAbsent: [ nil ]); 
		atpEntities: (aRequest at: 'entities' ifAbsent: [ nil ]); 
		atpFacets: (aRequest at: 'facets' ifAbsent: [ nil ]); 
		atpReply: (aRequest at: 'reply' ifPresent: [:aValue | AppBskyFeedPostReplyRef fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpEmbed: (aRequest at: 'embed' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEmbed [
	^ atpEmbed
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEntities [
	^ atpEntities
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEntities: anObject [
	atpEntities := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpFacets [
	^ atpFacets
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpFacets: anObject [
	atpFacets := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpReply [
	<referenceTo:'#replyRef'>
	^ atpReply
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpReply: anObject [
	<referenceTo:'#replyRef'>
	atpReply := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpText [
	^ atpText
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpText: anObject [
	atpText := anObject
]

{ #category : #magritte }
AppBskyFeedPostMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostMain >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images'. 'app.bsky.embed.external'. 'app.bsky.embed.record'. 'app.bsky.embed.recordWithMedia'};
		label: 'Embed';
		accessor: #atpEmbed
]

{ #category : #magritte }
AppBskyFeedPostMain >> entitiesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyFeedPostEntity};
		label: 'Entities';
		accessor: #atpEntities
]

{ #category : #magritte }
AppBskyFeedPostMain >> facetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'Facets';
		accessor: #atpFacets
]

{ #category : #magritte }
AppBskyFeedPostMain >> replyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reply';
		accessor: #atpReply
]

{ #category : #magritte }
AppBskyFeedPostMain >> textDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Text';
		accessor: #atpText;
	beRequired
]
