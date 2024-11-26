Class {
	#name : #AppBskyFeedPostgateDisableRule,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostgateDisableRule class >> atpDescription [
 ^  'Disables embedding of this post.'
]

{ #category : #accessing }
AppBskyFeedPostgateDisableRule class >> atpFile [
 ^ 'app/bsky/feed/postgate.json'
]

{ #category : #accessing }
AppBskyFeedPostgateDisableRule class >> atpRecordName [
 ^ 'app.bsky.feed.postgate#disableRule'
]

{ #category : #accessing }
AppBskyFeedPostgateDisableRule class >> atpSchema [
 ^ '{"type":"object","description":"Disables embedding of this post.","properties":{}}'
]

{ #category : #serialization }
AppBskyFeedPostgateDisableRule class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest
]
