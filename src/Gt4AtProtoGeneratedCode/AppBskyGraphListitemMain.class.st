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
AppBskyGraphListitemMain class >> atpDescription [
 ^ 'An item under a declared list of actors'
]

{ #category : #accessing }
AppBskyGraphListitemMain class >> atpFile [
 ^ 'app/bsky/graph/listitem.json'
]

{ #category : #accessing }
AppBskyGraphListitemMain class >> atpRecordName [
 ^ 'app.bsky.graph.listitem'
]

{ #category : #accessing }
AppBskyGraphListitemMain class >> atpSchema [
 ^ '{"type":"record","description":"An item under a declared list of actors","key":"tid","record":{"type":"object","required":["subject","list","createdAt"],"properties":{"subject":{"type":"string","format":"did"},"list":{"type":"string","format":"at-uri"},"createdAt":{"type":"string","format":"datetime"}}}}'
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
	<atpType:'string' format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList [
	<atpType:'string' format:'at-uri'>
	^ atpList
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList: anObject [
	atpList := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpSubject [
	<atpType:'string' format:'did'>
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
