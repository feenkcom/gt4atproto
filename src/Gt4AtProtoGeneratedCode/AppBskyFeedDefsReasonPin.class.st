Class {
	#name : #AppBskyFeedDefsReasonPin,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsReasonPin class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsReasonPin class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsReasonPin class >> atpRecordName [
 ^ 'app.bsky.feed.defs#reasonPin'
]

{ #category : #accessing }
AppBskyFeedDefsReasonPin class >> atpSchema [
 ^ '{"type":"object","properties":{}}'
]

{ #category : #serialization }
AppBskyFeedDefsReasonPin class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest
]
