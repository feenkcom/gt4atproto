Class {
	#name : #AppBskyFeedPostMain,
	#superclass : #Object,
	#instVars : [
		'atProtoText',
		'atProtoEntities',
		'atProtoFacets',
		'atProtoReply',
		'atProtoEmbed',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoEmbed [
	^ atProtoEmbed
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoEmbed: anObject [
	atProtoEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoEntities [
	^ atProtoEntities
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoEntities: anObject [
	atProtoEntities := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoFacets [
	^ atProtoFacets
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoFacets: anObject [
	atProtoFacets := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoReply [
	<referenceTo:'#replyRef'>
	^ atProtoReply
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoReply: anObject [
	<referenceTo:'#replyRef'>
	atProtoReply := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoText [
	^ atProtoText
]

{ #category : #accessing }
AppBskyFeedPostMain >> atProtoText: anObject [
	atProtoText := anObject
]

{ #category : #magritte }
AppBskyFeedPostMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostMain >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images'. 'app.bsky.embed.external'. 'app.bsky.embed.record'. 'app.bsky.embed.recordWithMedia'};
		label: 'Embed';
		accessor: #atProtoEmbed
]

{ #category : #magritte }
AppBskyFeedPostMain >> entitiesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Entity};
		label: 'Entities';
		accessor: #atProtoEntities
]

{ #category : #magritte }
AppBskyFeedPostMain >> facetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacet};
		label: 'Facets';
		accessor: #atProtoFacets
]

{ #category : #magritte }
AppBskyFeedPostMain >> replyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reply';
		accessor: #atProtoReply
]

{ #category : #magritte }
AppBskyFeedPostMain >> textDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Text';
		accessor: #atProtoText;
	beRequired
]
