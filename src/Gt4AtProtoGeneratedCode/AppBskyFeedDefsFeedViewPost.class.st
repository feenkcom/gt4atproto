Class {
	#name : #AppBskyFeedDefsFeedViewPost,
	#superclass : #Object,
	#instVars : [
		'atProtoPost',
		'atProtoReply',
		'atProtoReason'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsFeedViewPost class >> fromRequest: aRequest [
	^ self new atProtoPost: (aRequest at: 'post' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoReply: (aRequest at: 'reply' ifPresent: [:aValue | AppBskyFeedDefsReplyRef fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoReason: (aRequest at: 'reason' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoPost [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atProtoPost
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoPost: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atProtoPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoReply [
	<referenceTo:'#replyRef'>
	^ atProtoReply
]

{ #category : #accessing }
AppBskyFeedDefsFeedViewPost >> atProtoReply: anObject [
	<referenceTo:'#replyRef'>
	atProtoReply := anObject
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> postDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Post';
		accessor: #atProtoPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> reasonDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#reasonRepost'};
		label: 'Reason';
		accessor: #atProtoReason
]

{ #category : #magritte }
AppBskyFeedDefsFeedViewPost >> replyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reply';
		accessor: #atProtoReply
]
