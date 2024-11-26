Class {
	#name : #AppBskyFeedPostgateMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCreatedAt',
		'atpPost',
		'atpDetachedEmbeddingUris',
		'atpEmbeddingRules'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostgateMain class >> atpDescription [
 ^  'Record defining interaction rules for a post. The record key (rkey) of the postgate record must match the record key of the post, and that record must be in the same repository.'
]

{ #category : #accessing }
AppBskyFeedPostgateMain class >> atpFile [
 ^ 'app/bsky/feed/postgate.json'
]

{ #category : #accessing }
AppBskyFeedPostgateMain class >> atpRecordName [
 ^ 'app.bsky.feed.postgate'
]

{ #category : #accessing }
AppBskyFeedPostgateMain class >> atpSchema [
 ^ '{"type":"record","key":"tid","description":"Record defining interaction rules for a post. The record key (rkey) of the postgate record must match the record key of the post, and that record must be in the same repository.","record":{"type":"object","required":["post","createdAt"],"properties":{"createdAt":{"type":"string","format":"datetime"},"post":{"type":"string","format":"at-uri","description":"Reference (AT-URI) to the post record."},"detachedEmbeddingUris":{"type":"array","maxLength":50,"items":{"type":"string","format":"at-uri"},"description":"List of AT-URIs embedding this post that the author has detached from."},"embeddingRules":{"type":"array","maxLength":5,"items":{"type":"union","refs":["#disableRule"]}}}}}'
]

{ #category : #serialization }
AppBskyFeedPostgateMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpPost: (aRequest at: 'post' ifAbsent: [ nil ]);
		atpDetachedEmbeddingUris: (aRequest
				at: 'detachedEmbeddingUris'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpEmbeddingRules: (aRequest
				at: 'embeddingRules'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | 
							({'app.bsky.feed.postgate#disableRule' -> AppBskyFeedPostgateDisableRule}
								asDictionary at: (aValue at: '$type'))
								fromRequest: aValue
								withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpDetachedEmbeddingUris [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpDetachedEmbeddingUris
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpDetachedEmbeddingUris: anObject [
	atpDetachedEmbeddingUris := anObject
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpEmbeddingRules [
	<atpType:#(AppBskyFeedPostgateDisableRule) format:nil>
	<atpCollection>
	^ atpEmbeddingRules
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpEmbeddingRules: anObject [
	atpEmbeddingRules := anObject
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpPost [
	<atpType:#String format:'at-uri'>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedPostgateMain >> atpPost: anObject [
	atpPost := anObject
]

{ #category : #magritte }
AppBskyFeedPostgateMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostgateMain >> detachedEmbeddingUrisDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'DetachedEmbeddingUris';
		accessor: #atpDetachedEmbeddingUris
]

{ #category : #magritte }
AppBskyFeedPostgateMain >> embeddingRulesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyFeedPostgateDisableRule};
		label: 'EmbeddingRules';
		accessor: #atpEmbeddingRules
]

{ #category : #magritte }
AppBskyFeedPostgateMain >> postDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]
