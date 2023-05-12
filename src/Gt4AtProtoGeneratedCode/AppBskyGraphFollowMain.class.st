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
 ^ 'A social follow.'
]

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpRecordName [
 ^ 'app.bsky.graph.follow'
]

{ #category : #accessing }
AppBskyGraphFollowMain class >> atpSchema [
 ^ '{"type":"record","description":"A social follow.","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphFollowMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atpSubject [
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
