Class {
	#name : #AppBskyFeedLikeMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedLikeMain class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedLikeMain class >> atpFile [
 ^ 'app/bsky/feed/like.json'
]

{ #category : #accessing }
AppBskyFeedLikeMain class >> atpRecordName [
 ^ 'app.bsky.feed.like'
]

{ #category : #accessing }
AppBskyFeedLikeMain class >> atpSchema [
 ^ '{"type":"record","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"ref","ref":"com.atproto.repo.strongRef"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyFeedLikeMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpSubject [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpSubject: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyFeedLikeMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedLikeMain >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
