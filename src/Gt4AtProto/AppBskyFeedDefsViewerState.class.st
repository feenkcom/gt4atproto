Class {
	#name : #AppBskyFeedDefsViewerState,
	#superclass : #Object,
	#instVars : [
		'atProtoRepost',
		'atProtoLike'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atProtoLike [
	^ atProtoLike
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atProtoLike: anObject [
	atProtoLike := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atProtoRepost [
	^ atProtoRepost
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atProtoRepost: anObject [
	atProtoRepost := anObject
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> likeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Like';
		accessor: #atProtoLike
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> repostDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repost';
		accessor: #atProtoRepost
]
