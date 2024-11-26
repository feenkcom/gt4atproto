Class {
	#name : #AppBskyGraphListblockMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphListblockMain class >> atpDescription [
 ^  'Record representing a block relationship against an entire an entire list of accounts (actors).'
]

{ #category : #accessing }
AppBskyGraphListblockMain class >> atpFile [
 ^ 'app/bsky/graph/listblock.json'
]

{ #category : #accessing }
AppBskyGraphListblockMain class >> atpRecordName [
 ^ 'app.bsky.graph.listblock'
]

{ #category : #accessing }
AppBskyGraphListblockMain class >> atpSchema [
 ^ '{"type":"record","description":"Record representing a block relationship against an entire an entire list of accounts (actors).","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"string","format":"at-uri","description":"Reference (AT-URI) to the mod list record."},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphListblockMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphListblockMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListblockMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListblockMain >> atpSubject [
	<atpType:#String format:'at-uri'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphListblockMain >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphListblockMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphListblockMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
