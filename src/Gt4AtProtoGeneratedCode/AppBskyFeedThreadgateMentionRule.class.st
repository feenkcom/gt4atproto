Class {
	#name : #AppBskyFeedThreadgateMentionRule,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedThreadgateMentionRule class >> atpDescription [
 ^  'Allow replies from actors mentioned in your post.'
]

{ #category : #accessing }
AppBskyFeedThreadgateMentionRule class >> atpFile [
 ^ 'app/bsky/feed/threadgate.json'
]

{ #category : #accessing }
AppBskyFeedThreadgateMentionRule class >> atpRecordName [
 ^ 'app.bsky.feed.threadgate#mentionRule'
]

{ #category : #accessing }
AppBskyFeedThreadgateMentionRule class >> atpSchema [
 ^ '{"type":"object","description":"Allow replies from actors mentioned in your post.","properties":{}}'
]

{ #category : #serialization }
AppBskyFeedThreadgateMentionRule class >> fromRequest: aRequest [
	^ self new rawData: aRequest
]
