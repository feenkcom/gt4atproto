Class {
	#name : #AppBskyGraphBlockMain,
	#superclass : #Object,
	#instVars : [
		'atProtoSubject',
		'atProtoCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyGraphBlockMain class >> fromRequest: aRequest [
	^ self new atProtoSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #magritte }
AppBskyGraphBlockMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyGraphBlockMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atProtoSubject;
	beRequired
]
