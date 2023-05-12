Class {
	#name : #AppBskyGraphDefsListItemView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSubject'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListItemView class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listItemView'
]

{ #category : #serialization }
AppBskyGraphDefsListItemView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | AppBskyActorDefsProfileView fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpSubject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyGraphDefsListItemView >> atpSubject: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpSubject := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListItemView >> subjectDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
