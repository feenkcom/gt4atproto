Class {
	#name : #AppBskyFeedDefsReplyRef,
	#superclass : #Object,
	#instVars : [
		'atProtoRoot',
		'atProtoParent'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsReplyRef class >> fromRequest: aRequest [
	^ self new atProtoRoot: (AppBskyFeedDefsPostView fromRequest: (aRequest at: 'root' ifAbsent: [ nil ])); 
		atProtoParent: (AppBskyFeedDefsPostView fromRequest: (aRequest at: 'parent' ifAbsent: [ nil ]))
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atProtoParent [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atProtoParent
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atProtoParent: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atProtoParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atProtoRoot [
	<referenceTo:'app.bsky.feed.defs#postView'>
	^ atProtoRoot
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atProtoRoot: anObject [
	<referenceTo:'app.bsky.feed.defs#postView'>
	atProtoRoot := anObject
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> parentDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Parent';
		accessor: #atProtoParent;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> rootDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Root';
		accessor: #atProtoRoot;
		beRequired
]
