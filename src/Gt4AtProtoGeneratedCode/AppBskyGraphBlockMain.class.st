Class {
	#name : #AppBskyGraphBlockMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphBlockMain class >> atpRecordName [
 ^ 'app.bsky.graph.block'
]

{ #category : #serialization }
AppBskyGraphBlockMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpSubject [
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphBlockMain >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphBlockMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyGraphBlockMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
	beRequired
]
