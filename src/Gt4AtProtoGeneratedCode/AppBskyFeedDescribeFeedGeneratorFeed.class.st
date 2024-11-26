Class {
	#name : #AppBskyFeedDescribeFeedGeneratorFeed,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed class >> atpFile [
 ^ 'app/bsky/feed/describeFeedGenerator.json'
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed class >> atpRecordName [
 ^ 'app.bsky.feed.describeFeedGenerator#feed'
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyFeedDescribeFeedGeneratorFeed class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorFeed >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDescribeFeedGeneratorFeed >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
