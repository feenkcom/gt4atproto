Class {
	#name : #AppBskyFeedDefsViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRepost',
		'atpLike'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsViewerState class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRepost: (aRequest at: 'repost' ifAbsent: [ nil ]); 
		atpLike: (aRequest at: 'like' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpLike [
	^ atpLike
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpLike: anObject [
	atpLike := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpRepost [
	^ atpRepost
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpRepost: anObject [
	atpRepost := anObject
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> likeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Like';
		accessor: #atpLike
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> repostDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repost';
		accessor: #atpRepost
]
