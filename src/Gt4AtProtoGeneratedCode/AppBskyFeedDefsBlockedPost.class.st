Class {
	#name : #AppBskyFeedDefsBlockedPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpBlocked',
		'atpAuthor'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsBlockedPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#blockedPost'
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost class >> atpSchema [
 ^ '{"type":"object","required":["uri","blocked","author"],"properties":{"uri":{"type":"string","format":"at-uri"},"blocked":{"type":"boolean","const":true},"author":{"type":"ref","ref":"#blockedAuthor"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsBlockedPost class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpBlocked: (aRequest at: 'blocked' ifAbsent: [ nil ]);
		atpAuthor: (aRequest
				at: 'author'
				ifPresent: [ :aValue | AppBskyFeedDefsBlockedAuthor fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpAuthor [
	<referenceTo:'#blockedAuthor'>
	<atpType:#AppBskyFeedDefsBlockedAuthor format:nil>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpAuthor: anObject [
	<referenceTo:'#blockedAuthor'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpBlocked [
	<atpType:#Boolean format:nil>
	^ atpBlocked
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpBlocked: anObject [
	atpBlocked := anObject
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atpAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> blockedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Blocked';
		accessor: #atpBlocked;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
