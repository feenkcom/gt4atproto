Class {
	#name : #AppBskyGraphFollowMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpDescription [
 ^  'Record declaring a social ''follow'' relationship of another account. Duplicate follows will be ignored by the AppView.'
]

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpFile [
 ^ 'app/bsky/graph/follow.json'
]

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpRecordName [
 ^ 'app.bsky.graph.follow'
]

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpSchema [
 ^ '{"type":"record","description":"Record declaring a social ''follow'' relationship of another account. Duplicate follows will be ignored by the AppView.","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphFollowMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpSubject [
	<atpType:#String format:'did'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphFollowMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphFollowMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
