Class {
	#name : #AppBskyGraphListitemMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpList',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphListitemMain class >> atpRecordName [
 ^ 'app.bsky.graph.listitem'
]

{ #category : #serialization }
AppBskyGraphListitemMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atpList: (aRequest at: 'list' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList [
	^ atpList
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList: anObject [
	atpList := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpSubject [
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphListitemMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
AppBskyGraphListitemMain >> listDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'List';
		accessor: #atpList;
	beRequired
]

{ #category : #magritte }
AppBskyGraphListitemMain >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
	beRequired
]
