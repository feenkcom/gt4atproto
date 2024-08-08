Class {
	#name : #AppBskyFeedThreadgateListRule,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpList'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedThreadgateListRule class >> atpDescription [
 ^  'Allow replies from actors on a list.'
]

{ #category : #accessing }
AppBskyFeedThreadgateListRule class >> atpFile [
 ^ 'app/bsky/feed/threadgate.json'
]

{ #category : #accessing }
AppBskyFeedThreadgateListRule class >> atpRecordName [
 ^ 'app.bsky.feed.threadgate#listRule'
]

{ #category : #accessing }
AppBskyFeedThreadgateListRule class >> atpSchema [
 ^ '{"type":"object","description":"Allow replies from actors on a list.","required":["list"],"properties":{"list":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyFeedThreadgateListRule class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpList: (aRequest at: 'list' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedThreadgateListRule >> atpList [
	<atpType:#String format:'at-uri'>
	^ atpList
]

{ #category : #accessing }
AppBskyFeedThreadgateListRule >> atpList: anObject [
	atpList := anObject
]

{ #category : #magritte }
AppBskyFeedThreadgateListRule >> listDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'List';
		accessor: #atpList;
		beRequired
]
