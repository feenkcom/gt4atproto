Class {
	#name : #AppBskyFeedThreadgateMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPost',
		'atpAllow',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedThreadgateMain class >> atpDescription [
 ^  'Record defining interaction gating rules for a thread (aka, reply controls). The record key (rkey) of the threadgate record must match the record key of the thread''s root post, and that record must be in the same repository..'
]

{ #category : #accessing }
AppBskyFeedThreadgateMain class >> atpFile [
 ^ 'app/bsky/feed/threadgate.json'
]

{ #category : #accessing }
AppBskyFeedThreadgateMain class >> atpRecordName [
 ^ 'app.bsky.feed.threadgate'
]

{ #category : #accessing }
AppBskyFeedThreadgateMain class >> atpSchema [
 ^ '{"type":"record","key":"tid","description":"Record defining interaction gating rules for a thread (aka, reply controls). The record key (rkey) of the threadgate record must match the record key of the thread''s root post, and that record must be in the same repository..","record":{"type":"object","required":["post","createdAt"],"properties":{"post":{"type":"string","format":"at-uri","description":"Reference (AT-URI) to the post record."},"allow":{"type":"array","maxLength":5,"items":{"type":"union","refs":["#mentionRule","#followingRule","#listRule"]}},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyFeedThreadgateMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest at: 'post' ifAbsent: [ nil ]);
		atpAllow: (aRequest
				at: 'allow'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | 
							({'app.bsky.feed.threadgate#mentionRule' -> AppBskyFeedThreadgateMentionRule.
								'app.bsky.feed.threadgate#followingRule'
									-> AppBskyFeedThreadgateFollowingRule.
								'app.bsky.feed.threadgate#listRule' -> AppBskyFeedThreadgateListRule}
								asDictionary at: (aValue at: '$type')) fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyFeedThreadgateMain >> allowDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyFeedThreadgateMentionRule AppBskyFeedThreadgateFollowingRule
					AppBskyFeedThreadgateListRule};
		label: 'Allow';
		accessor: #atpAllow
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpAllow [
	<atpType:#(AppBskyFeedThreadgateMentionRule AppBskyFeedThreadgateFollowingRule AppBskyFeedThreadgateListRule) format:nil>
	<atpCollection>
	^ atpAllow
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpAllow: anObject [
	atpAllow := anObject
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpPost [
	<atpType:#String format:'at-uri'>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedThreadgateMain >> atpPost: anObject [
	atpPost := anObject
]

{ #category : #magritte }
AppBskyFeedThreadgateMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedThreadgateMain >> postDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]
