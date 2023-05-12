Class {
	#name : #AppBskyFeedPostReplyRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRoot',
		'atpParent'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostReplyRef class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedPostReplyRef class >> atpRecordName [
 ^ 'app.bsky.feed.post#replyRef'
]

{ #category : #accessing }
AppBskyFeedPostReplyRef class >> atpSchema [
 ^ '{"type":"object","required":["root","parent"],"properties":{"root":{"type":"ref","ref":"com.atproto.repo.strongRef"},"parent":{"type":"ref","ref":"com.atproto.repo.strongRef"}}}'
]

{ #category : #serialization }
AppBskyFeedPostReplyRef class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRoot: (aRequest at: 'root' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpParent: (aRequest at: 'parent' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atpParent [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atpParent
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atpParent: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpParent := anObject
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atpRoot [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atpRoot
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atpRoot: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpRoot := anObject
]

{ #category : #magritte }
AppBskyFeedPostReplyRef >> parentDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Parent';
		accessor: #atpParent;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostReplyRef >> rootDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Root';
		accessor: #atpRoot;
		beRequired
]
