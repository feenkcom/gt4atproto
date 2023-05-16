Class {
	#name : #AppBskyFeedDefsReasonRepost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpBy',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsReasonRepost class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#reasonRepost'
]

{ #category : #accessing }
AppBskyFeedDefsReasonRepost class >> atpSchema [
 ^ '{"type":"object","required":["by","indexedAt"],"properties":{"by":{"type":"ref","ref":"app.bsky.actor.defs#profileViewBasic"},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsReasonRepost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpBy: (aRequest
				at: 'by'
				ifPresent: [ :aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ]
				ifAbsent: [ nil ]);
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
	<atpType:'string' format:'datetime'>
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
