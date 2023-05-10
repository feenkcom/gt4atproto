Class {
	#name : #AppBskyFeedLikeMain,
	#superclass : #Object,
	#instVars : [
		'atProtoSubject',
		'atProtoCreatedAt'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
