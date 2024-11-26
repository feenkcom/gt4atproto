Class {
	#name : #AppBskyFeedThreadgateFollowingRule,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedThreadgateFollowingRule class >> atpDescription [
 ^  'Allow replies from actors you follow.'
]

{ #category : #accessing }
AppBskyFeedThreadgateFollowingRule class >> atpFile [
 ^ 'app/bsky/feed/threadgate.json'
]

{ #category : #accessing }
AppBskyFeedThreadgateFollowingRule class >> atpRecordName [
 ^ 'app.bsky.feed.threadgate#followingRule'
]

{ #category : #accessing }
AppBskyFeedThreadgateFollowingRule class >> atpSchema [
 ^ '{"type":"object","description":"Allow replies from actors you follow.","properties":{}}'
]

{ #category : #serialization }
AppBskyFeedThreadgateFollowingRule class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest
]
