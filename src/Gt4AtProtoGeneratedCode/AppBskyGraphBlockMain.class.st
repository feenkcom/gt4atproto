Class {
	#name : #AppBskyGraphBlockMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphBlockMain class >> atpDescription [
 ^  'Record declaring a ''block'' relationship against another account. NOTE: blocks are public in Bluesky; see blog posts for details.'
]

{ #category : #accessing }
AppBskyGraphBlockMain class >> atpFile [
 ^ 'app/bsky/graph/block.json'
]

{ #category : #accessing }
AppBskyGraphBlockMain class >> atpRecordName [
 ^ 'app.bsky.graph.block'
]

{ #category : #accessing }
AppBskyGraphBlockMain class >> atpSchema [
 ^ '{"type":"record","description":"Record declaring a ''block'' relationship against another account. NOTE: blocks are public in Bluesky; see blog posts for details.","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"string","format":"did","description":"DID of the account to be blocked."},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphBlockMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpSubject [
	<atpType:#String format:'did'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphBlockMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphBlockMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
