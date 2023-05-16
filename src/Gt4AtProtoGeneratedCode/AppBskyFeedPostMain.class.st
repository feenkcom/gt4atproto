Class {
	#name : #AppBskyFeedPostMain,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyFeedPostMain',
	#classTraits : 'TAppBskyFeedPostMain classTrait',
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

{ #category : #accessing }
AppBskyFeedPostMain class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedPostMain class >> atpFile [
 ^ 'app/bsky/feed/post.json'
]

{ #category : #accessing }
AppBskyFeedPostMain class >> atpRecordName [
 ^ 'app.bsky.feed.post'
]

{ #category : #accessing }
AppBskyFeedPostMain class >> atpSchema [
 ^ '{"type":"record","key":"tid","record":{"type":"object","required":["text","createdAt"],"properties":{"text":{"type":"string","maxLength":3000,"maxGraphemes":300},"entities":{"type":"array","description":"Deprecated: replaced by app.bsky.richtext.facet.","items":{"type":"ref","ref":"#entity"}},"facets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"reply":{"type":"ref","ref":"#replyRef"},"embed":{"type":"union","refs":["app.bsky.embed.images","app.bsky.embed.external","app.bsky.embed.record","app.bsky.embed.recordWithMedia"]},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyFeedPostMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpText: (aRequest at: 'text' ifAbsent: [ nil ]);
		atpEntities: (aRequest
				at: 'entities'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyFeedPostEntity fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpFacets: (aRequest
				at: 'facets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpReply: (aRequest
				at: 'reply'
				ifPresent: [ :aValue | AppBskyFeedPostReplyRef fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpEmbed: (aRequest
				at: 'embed'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.images' -> AppBskyEmbedImagesMain.
						'app.bsky.embed.external' -> AppBskyEmbedExternalMain.
						'app.bsky.embed.record' -> AppBskyEmbedRecordMain.
						'app.bsky.embed.recordWithMedia' -> AppBskyEmbedRecordWithMediaMain}
						asDictionary at: (aValue at: '$type')) fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt [
	<atpType:'string' format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEmbed [
	<atpType:#(AppBskyEmbedImagesMain. AppBskyEmbedExternalMain. AppBskyEmbedRecordMain. AppBskyEmbedRecordWithMediaMain) format:nil>
	^ atpEmbed
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEntities [
	<atpType:#AppBskyFeedPostEntity format:nil>
	<atpCollection>
	^ atpEntities
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEntities: anObject [
	atpEntities := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
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
	<atpType:'string' format:nil>
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
		options: {'app.bsky.embed.images'.
				'app.bsky.embed.external'.
				'app.bsky.embed.record'.
				'app.bsky.embed.recordWithMedia'};
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
