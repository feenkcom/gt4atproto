Class {
	#name : #AppBskyFeedDefsSkeletonReasonRepost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRepost'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#skeletonReasonRepost'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost class >> atpSchema [
 ^ '{"type":"object","required":["repost"],"properties":{"repost":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsSkeletonReasonRepost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRepost: (aRequest at: 'repost' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost >> atpRepost [
	<atpType:#String format:'at-uri'>
	^ atpRepost
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonRepost >> atpRepost: anObject [
	atpRepost := anObject
]

{ #category : #magritte }
AppBskyFeedDefsSkeletonReasonRepost >> repostDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repost';
		accessor: #atpRepost;
		beRequired
]
