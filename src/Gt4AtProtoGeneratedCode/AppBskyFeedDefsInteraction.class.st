Class {
	#name : #AppBskyFeedDefsInteraction,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpItem',
		'atpEvent',
		'atpFeedContext'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsInteraction class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsInteraction class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsInteraction class >> atpRecordName [
 ^ 'app.bsky.feed.defs#interaction'
]

{ #category : #accessing }
AppBskyFeedDefsInteraction class >> atpSchema [
 ^ '{"type":"object","properties":{"item":{"type":"string","format":"at-uri"},"event":{"type":"string","knownValues":["app.bsky.feed.defs#requestLess","app.bsky.feed.defs#requestMore","app.bsky.feed.defs#clickthroughItem","app.bsky.feed.defs#clickthroughAuthor","app.bsky.feed.defs#clickthroughReposter","app.bsky.feed.defs#clickthroughEmbed","app.bsky.feed.defs#interactionSeen","app.bsky.feed.defs#interactionLike","app.bsky.feed.defs#interactionRepost","app.bsky.feed.defs#interactionReply","app.bsky.feed.defs#interactionQuote","app.bsky.feed.defs#interactionShare"]},"feedContext":{"type":"string","description":"Context on a feed item that was originally supplied by the feed generator on getFeedSkeleton.","maxLength":2000}}}'
]

{ #category : #serialization }
AppBskyFeedDefsInteraction class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpItem: (aRequest at: 'item' ifAbsent: [ nil ]);
		atpEvent: (aRequest at: 'event' ifAbsent: [ nil ]);
		atpFeedContext: (aRequest at: 'feedContext' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpEvent [
	<atpType:#String format:nil>
	^ atpEvent
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpEvent: anObject [
	atpEvent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpFeedContext [
	<atpType:#String format:nil>
	^ atpFeedContext
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpFeedContext: anObject [
	atpFeedContext := anObject
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpItem [
	<atpType:#String format:'at-uri'>
	^ atpItem
]

{ #category : #accessing }
AppBskyFeedDefsInteraction >> atpItem: anObject [
	atpItem := anObject
]

{ #category : #magritte }
AppBskyFeedDefsInteraction >> eventDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Event';
		accessor: #atpEvent
]

{ #category : #magritte }
AppBskyFeedDefsInteraction >> feedContextDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FeedContext';
		accessor: #atpFeedContext
]

{ #category : #magritte }
AppBskyFeedDefsInteraction >> itemDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Item';
		accessor: #atpItem
]
