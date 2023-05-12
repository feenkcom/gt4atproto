Class {
	#name : #AppBskyFeedRepostMain,
	#superclass : #Object,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedRepostMain class >> fromRequest: aRequest [
	^ self new atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atpSubject [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyFeedRepostMain >> atpSubject: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyFeedRepostMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedRepostMain >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]