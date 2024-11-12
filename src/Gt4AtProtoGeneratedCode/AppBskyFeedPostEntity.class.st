Class {
	#name : #AppBskyFeedPostEntity,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpIndex',
		'atpType',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostEntity class >> atpDescription [
 ^  'Deprecated: use facets instead.'
]

{ #category : #accessing }
AppBskyFeedPostEntity class >> atpFile [
 ^ 'app/bsky/feed/post.json'
]

{ #category : #accessing }
AppBskyFeedPostEntity class >> atpRecordName [
 ^ 'app.bsky.feed.post#entity'
]

{ #category : #accessing }
AppBskyFeedPostEntity class >> atpSchema [
 ^ '{"type":"object","description":"Deprecated: use facets instead.","required":["index","type","value"],"properties":{"index":{"type":"ref","ref":"#textSlice"},"type":{"type":"string","description":"Expected values are ''mention'' and ''link''."},"value":{"type":"string"}}}'
]

{ #category : #serialization }
AppBskyFeedPostEntity class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpIndex: (aRequest
				at: 'index'
				ifPresent: [ :aValue | AppBskyFeedPostTextSlice fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpType: (aRequest at: 'type' ifAbsent: [ nil ]);
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpIndex [
	<referenceTo:'#textSlice'>
	<atpType:#AppBskyFeedPostTextSlice format:nil>
	^ atpIndex
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpIndex: anObject [
	<referenceTo:'#textSlice'>
	atpIndex := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpType [
	<atpType:#String format:nil>
	^ atpType
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpType: anObject [
	atpType := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpValue [
	<atpType:#String format:nil>
	^ atpValue
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
AppBskyFeedPostEntity >> indexDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Index';
		accessor: #atpIndex;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> typeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Type';
		accessor: #atpType;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
