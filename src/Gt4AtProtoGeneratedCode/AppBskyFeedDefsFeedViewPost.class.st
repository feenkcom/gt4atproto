Class {
	#name : #AppBskyFeedDefsFeedViewPost,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyFeedDefsFeedViewPost',
	#classTraits : 'TAppBskyFeedDefsFeedViewPost classTrait',
	#instVars : [
		'atpPost',
		'atpReply',
		'atpReason',
		'atpFeedContext'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#feedViewPost'
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpSchema [
 ^ '{"type":"object","required":["post"],"properties":{"post":{"type":"ref","ref":"#postView"},"reply":{"type":"ref","ref":"#replyRef"},"reason":{"type":"union","refs":["#reasonRepost","#reasonPin"]},"feedContext":{"type":"string","description":"Context provided by feed generator that may be passed back alongside interactions.","maxLength":2000}}}'
]

{ #category : #serialization }
AppBskyFeedDefsFeedViewPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest
				at: 'post'
				ifPresent: [ :aValue | AppBskyFeedDefsPostView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReply: (aRequest
				at: 'reply'
				ifPresent: [ :aValue | AppBskyFeedDefsReplyRef fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReason: (aRequest
				at: 'reason'
				ifPresent: [ :aValue | 
					({'app.bsky.feed.defs#reasonRepost' -> AppBskyFeedDefsReasonRepost.
						'app.bsky.feed.defs#reasonPin' -> AppBskyFeedDefsReasonPin} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpFeedContext: (aRequest at: 'feedContext' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpFeedContext [
	<atpType:#String format:nil>
	^ atpFeedContext
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpFeedContext: anObject [
	atpFeedContext := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpPost [
	<referenceTo:'#postView'>
	<atpType:#AppBskyFeedDefsPostView format:nil>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpPost: anObject [
	<referenceTo:'#postView'>
	atpPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReason [
	<atpType:#(AppBskyFeedDefsReasonRepost AppBskyFeedDefsReasonPin) format:nil>
	^ atpReason
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReply [
	<referenceTo:'#replyRef'>
	<atpType:#AppBskyFeedDefsReplyRef format:nil>
	^ atpReply
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReply: anObject [
	<referenceTo:'#replyRef'>
	atpReply := anObject
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> feedContextDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FeedContext';
		accessor: #atpFeedContext
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> postDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> reasonDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#reasonRepost'.
				'#reasonPin'};
		label: 'Reason';
		accessor: #atpReason
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> replyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reply';
		accessor: #atpReply
]
