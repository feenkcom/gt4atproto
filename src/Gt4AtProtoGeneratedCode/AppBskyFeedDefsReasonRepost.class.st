Class {
	#name : #AppBskyFeedDefsReasonRepost,
	#superclass : #Object,
	#instVars : [
		'atpBy',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsReasonRepost class >> fromRequest: aRequest [
	^ self new atpBy: (aRequest at: 'by' ifPresent: [:aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atpBy [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atpBy
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atpBy: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpBy := anObject
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #magritte }
AppBskyFeedDefsReasonRepost >> byDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'By';
		accessor: #atpBy;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsReasonRepost >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
	beRequired
]
