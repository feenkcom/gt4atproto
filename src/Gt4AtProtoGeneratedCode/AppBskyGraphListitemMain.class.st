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
 ^  'Record representing an account''s inclusion on a specific list. The AppView will ignore duplicate listitem records.'
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
 ^ '{"type":"record","description":"Record representing an account''s inclusion on a specific list. The AppView will ignore duplicate listitem records.","key":"tid","record":{"type":"object","required":["subject","list","createdAt"],"properties":{"subject":{"type":"string","format":"did","description":"The account which is included on the list."},"list":{"type":"string","format":"at-uri","description":"Reference (AT-URI) to the list record (app.bsky.graph.list)."},"createdAt":{"type":"string","format":"datetime"}}}}'
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
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList [
	<atpType:#String format:'at-uri'>
	^ atpList
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpList: anObject [
	atpList := anObject
]

{ #category : #accessing }
AppBskyGraphListitemMain >> atpSubject [
	<atpType:#String format:'did'>
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
