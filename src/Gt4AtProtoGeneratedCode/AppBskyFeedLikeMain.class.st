Class {
	#name : #AppBskyFeedLikeMain,
	#superclass : #Object,
	#instVars : [
		'atProtoSubject',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedLikeMain class >> fromRequest: aRequest [
	^ self new atProtoSubject: (aRequest at: 'subject' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atProtoSubject [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atProtoSubject
]

{ #category : #accessing }
AppBskyFeedLikeMain >> atProtoSubject: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atProtoSubject := anObject
]

{ #category : #magritte }
AppBskyFeedLikeMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedLikeMain >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
