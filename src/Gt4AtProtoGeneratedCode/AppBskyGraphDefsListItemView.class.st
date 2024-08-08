Class {
	#name : #AppBskyGraphDefsListItemView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject',
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListItemView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyGraphDefsListItemView class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsListItemView class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listItemView'
]

{ #category : #accessing }
AppBskyGraphDefsListItemView class >> atpSchema [
 ^ '{"type":"object","required":["subject"],"properties":{"subject":{"type":"ref","ref":"app.bsky.actor.defs#profileView"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsListItemView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpSubject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	<atpType:#AppBskyActorDefsProfileView format:nil>
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpSubject: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpSubject := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListItemView >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListItemView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
