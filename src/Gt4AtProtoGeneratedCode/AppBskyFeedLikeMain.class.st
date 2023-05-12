Class {
	#name : #AppBskyFeedLikeMain,
	#superclass : #Object,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedLikeMain class >> fromRequest: aRequest [
	^ self new atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
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