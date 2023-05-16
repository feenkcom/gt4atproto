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
 ^ 'A block.'
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
 ^ '{"type":"record","description":"A block.","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphBlockMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt [
	<atpType:'string' format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpSubject [
	<atpType:'string' format:'did'>
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
