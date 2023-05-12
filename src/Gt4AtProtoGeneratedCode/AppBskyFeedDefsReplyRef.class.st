Class {
	#name : #AppBskyFeedDefsReplyRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRoot',
		'atpParent'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpRecordName [
 ^ 'app.bsky.feed.defs#replyRef'
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpSchema [
 ^ '{"type":"object","required":["root","parent"],"properties":{"root":{"type":"ref","ref":"app.bsky.feed.defs#postView"},"parent":{"type":"ref","ref":"app.bsky.feed.defs#postView"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsReplyRef class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRoot: (aRequest at: 'root' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpParent: (aRequest at: 'parent' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpParent [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atpParent
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpParent: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atpParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpRoot [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atpRoot
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpRoot: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atpRoot := anObject
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> parentDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Parent';
		accessor: #atpParent;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> rootDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Root';
		accessor: #atpRoot;
		beRequired
]
