Class {
	#name : #AppBskyFeedDefsSkeletonReasonPin,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonPin class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonPin class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonPin class >> atpRecordName [
 ^ 'app.bsky.feed.defs#skeletonReasonPin'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonReasonPin class >> atpSchema [
 ^ '{"type":"object","properties":{}}'
]

{ #category : #serialization }
AppBskyFeedDefsSkeletonReasonPin class >> fromRequest: aRequest [
	^ self new rawData: aRequest
]
