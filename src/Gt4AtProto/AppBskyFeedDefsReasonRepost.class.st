Class {
	#name : #AppBskyFeedDefsReasonRepost,
	#superclass : #Object,
	#instVars : [
		'atProtoBy',
		'atProtoIndexedAt'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atProtoBy [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atProtoBy
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atProtoBy: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atProtoBy := anObject
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #magritte }
AppBskyFeedDefsReasonRepost >> byDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'By';
		accessor: #atProtoBy;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsReasonRepost >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]
