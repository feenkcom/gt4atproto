Class {
	#name : #AppBskyGraphFollowMain,
	#superclass : #Object,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyGraphFollowMain class >> fromRequest: aRequest [
	^ self new atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
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