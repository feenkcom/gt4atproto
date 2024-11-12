Class {
	#name : #AppBskyFeedPostTextSlice,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpStart',
		'atpEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedPostTextSlice class >> atpDescription [
 ^  'Deprecated. Use app.bsky.richtext instead -- A text segment. Start is inclusive, end is exclusive. Indices are for utf16-encoded strings.'
]

{ #category : #accessing }
AppBskyFeedPostTextSlice class >> atpFile [
 ^ 'app/bsky/feed/post.json'
]

{ #category : #accessing }
AppBskyFeedPostTextSlice class >> atpRecordName [
 ^ 'app.bsky.feed.post#textSlice'
]

{ #category : #accessing }
AppBskyFeedPostTextSlice class >> atpSchema [
 ^ '{"type":"object","description":"Deprecated. Use app.bsky.richtext instead -- A text segment. Start is inclusive, end is exclusive. Indices are for utf16-encoded strings.","required":["start","end"],"properties":{"start":{"type":"integer","minimum":0},"end":{"type":"integer","minimum":0}}}'
]

{ #category : #serialization }
AppBskyFeedPostTextSlice class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpStart: (aRequest at: 'start' ifAbsent: [ nil ]);
		atpEnd: (aRequest at: 'end' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpEnd [
	<atpType:#Number format:nil>
	^ atpEnd
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpEnd: anObject [
	atpEnd := anObject
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpStart [
	<atpType:#Number format:nil>
	^ atpStart
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpStart: anObject [
	atpStart := anObject
]

{ #category : #magritte }
AppBskyFeedPostTextSlice >> endDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'End';
		accessor: #atpEnd;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostTextSlice >> startDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Start';
		accessor: #atpStart;
		beRequired
]
