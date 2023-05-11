Class {
	#name : #AppBskyGraphFollowMain,
	#superclass : #Object,
	#instVars : [
		'atProtoSubject',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyGraphFollowMain class >> fromRequest: aRequest [
	^ self new atProtoSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
AppBskyGraphFollowMain >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #magritte }
AppBskyGraphFollowMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyGraphFollowMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atProtoSubject;
	beRequired
]
