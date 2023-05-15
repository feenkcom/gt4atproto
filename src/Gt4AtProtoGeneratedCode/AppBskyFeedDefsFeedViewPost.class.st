Class {
	#name : #AppBskyFeedDefsFeedViewPost,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyFeedDefsFeedViewPost',
	#classTraits : 'TAppBskyFeedDefsFeedViewPost classTrait',
	#instVars : [
		'atpPost',
		'atpReply',
		'atpReason'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#feedViewPost'
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost class >> atpSchema [
 ^ '{"type":"object","required":["post"],"properties":{"post":{"type":"ref","ref":"app.bsky.feed.defs#postView"},"reply":{"type":"ref","ref":"#replyRef"},"reason":{"type":"union","refs":["#reasonRepost"]}}}'
]

{ #category : #serialization }
AppBskyFeedDefsFeedViewPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest at: 'post' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpReply: (aRequest at: 'reply' ifPresent: [:aValue | AppBskyFeedDefsReplyRef fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpReason: (aRequest at: 'reason' ifPresent: [:aValue | ({'app.bsky.feed.defs#reasonRepost' -> AppBskyFeedDefsReasonRepost} asDictionary at: (aValue at: '$type')) fromRequest: aValue] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpPost [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpPost: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atpPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReason [
	^ atpReason
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReply [
	<referenceTo:'#replyRef'>
	^ atpReply
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atpReply: anObject [
	<referenceTo:'#replyRef'>
	atpReply := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> gtCardsThreadFor: aView [
	<gtView>
	^ aView explicit
		title: 'Thread';
		priority: 0;
		stencil: [ BrSimpleTree new
				nodeStencil: [ GtApFeedPostSummaryElement new
						withShadowAndHighlighting ];
				nodeDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								e target phlow spawnObject: aPostElement post ] ];
				items: {self getRoot} lazy: [ :each | each replies ];
				expandOneLevel ]
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> gtCompactThreadFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Compact thread';
		priority: 0;
		items: [ {self getRoot} ];
		children: [ :each | each replies ];
		column: 'Author' text: [ :each | each author atpDisplayName ];
		column: 'Text' text: [ :each | each atpPost atpRecord atpText ];
		column: 'Created at' text: [ :each | each atpPost atpRecord createdAtTimestamp ]
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
		options: {'#reasonRepost'};
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
