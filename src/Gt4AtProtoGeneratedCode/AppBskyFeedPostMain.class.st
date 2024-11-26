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
		'atpLangs',
		'atpLabels',
		'atpTags',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostMain class >> atpDescription [
 ^  'Record containing a Bluesky post.'
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
 ^ '{"type":"record","description":"Record containing a Bluesky post.","key":"tid","record":{"type":"object","required":["text","createdAt"],"properties":{"text":{"type":"string","maxLength":3000,"maxGraphemes":300,"description":"The primary post content. May be an empty string, if there are embeds."},"entities":{"type":"array","description":"DEPRECATED: replaced by app.bsky.richtext.facet.","items":{"type":"ref","ref":"#entity"}},"facets":{"type":"array","description":"Annotations of text (mentions, URLs, hashtags, etc)","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"reply":{"type":"ref","ref":"#replyRef"},"embed":{"type":"union","refs":["app.bsky.embed.images","app.bsky.embed.video","app.bsky.embed.external","app.bsky.embed.record","app.bsky.embed.recordWithMedia"]},"langs":{"type":"array","description":"Indicates human language of post primary text content.","maxLength":3,"items":{"type":"string","format":"language"}},"labels":{"type":"union","description":"Self-label values for this post. Effectively content warnings.","refs":["com.atproto.label.defs#selfLabels"]},"tags":{"type":"array","description":"Additional hashtags, in addition to any included in post text and facets.","maxLength":8,"items":{"type":"string","maxLength":640,"maxGraphemes":64}},"createdAt":{"type":"string","format":"datetime","description":"Client-declared timestamp when this post was originally created."}}}}'
]

{ #category : #serialization }
AppBskyFeedPostMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpText: (aRequest at: 'text' ifAbsent: [ nil ]);
		atpEntities: (aRequest
				at: 'entities'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyFeedPostEntity fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpFacets: (aRequest
				at: 'facets'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpReply: (aRequest
				at: 'reply'
				ifPresent: [ :aValue | AppBskyFeedPostReplyRef fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpEmbed: (aRequest
				at: 'embed'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.images' -> AppBskyEmbedImagesMain.
						'app.bsky.embed.video' -> AppBskyEmbedVideoMain.
						'app.bsky.embed.external' -> AppBskyEmbedExternalMain.
						'app.bsky.embed.record' -> AppBskyEmbedRecordMain.
						'app.bsky.embed.recordWithMedia' -> AppBskyEmbedRecordWithMediaMain}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpLangs: (aRequest
				at: 'langs'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :aValue | 
					({'com.atproto.label.defs#selfLabels' -> ComAtprotoLabelDefsSelfLabels}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpTags: (aRequest
				at: 'tags'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpEmbed [
	<atpType:#(AppBskyEmbedImagesMain AppBskyEmbedVideoMain AppBskyEmbedExternalMain AppBskyEmbedRecordMain AppBskyEmbedRecordWithMediaMain) format:nil>
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
AppBskyFeedPostMain >> atpLabels [
	<atpType:#(ComAtprotoLabelDefsSelfLabels) format:nil>
	^ atpLabels
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpLangs [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpLangs
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpLangs: anObject [
	atpLangs := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpReply [
	<referenceTo:'#replyRef'>
	<atpType:#AppBskyFeedPostReplyRef format:nil>
	^ atpReply
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpReply: anObject [
	<referenceTo:'#replyRef'>
	atpReply := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpTags [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpTags
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpTags: anObject [
	atpTags := anObject
]

{ #category : #accessing }
AppBskyFeedPostMain >> atpText [
	<atpType:#String format:nil>
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
				'app.bsky.embed.video'.
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
AppBskyFeedPostMain >> labelsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.label.defs#selfLabels'};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyFeedPostMain >> langsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Langs';
		accessor: #atpLangs
]

{ #category : #magritte }
AppBskyFeedPostMain >> replyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reply';
		accessor: #atpReply
]

{ #category : #magritte }
AppBskyFeedPostMain >> tagsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Tags';
		accessor: #atpTags
]

{ #category : #magritte }
AppBskyFeedPostMain >> textDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Text';
		accessor: #atpText;
		beRequired
]
