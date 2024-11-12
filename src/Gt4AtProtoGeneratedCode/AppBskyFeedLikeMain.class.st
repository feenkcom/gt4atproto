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
 ^  'Record declaring a ''like'' of a piece of subject content.'
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
 ^ '{"type":"record","description":"Record declaring a ''like'' of a piece of subject content.","key":"tid","record":{"type":"object","required":["subject","createdAt"],"properties":{"subject":{"type":"ref","ref":"com.atproto.repo.strongRef"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyFeedLikeMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atpSubject [
	<referenceTo:'com.atproto.repo.strongRef'>
	<atpType:#ComAtprotoRepoStrongRefMain format:nil>
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
