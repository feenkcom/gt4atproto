Class {
	#name : #AppBskyFeedRepostMain,
	#superclass : #Object,
	#instVars : [
		'atProtoSubject',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedRepostMain class >> fromRequest: aRequest [
	^ self new atProtoSubject: (aRequest at: 'subject' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atProtoSubject [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atProtoSubject
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atProtoSubject: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atProtoSubject := anObject
]

{ #category : #magritte }
AppBskyFeedRepostMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedRepostMain >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
