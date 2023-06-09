Class {
	#name : #AppBskyRichtextFacetByteSlice,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpByteStart',
		'atpByteEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyRichtextFacetByteSlice class >> atpDescription [
 ^ 'A text segment. Start is inclusive, end is exclusive. Indices are for utf8-encoded strings.'
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice class >> atpFile [
 ^ 'app/bsky/richtext/facet.json'
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice class >> atpRecordName [
 ^ 'app.bsky.richtext.facet#byteSlice'
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice class >> atpSchema [
 ^ '{"type":"object","description":"A text segment. Start is inclusive, end is exclusive. Indices are for utf8-encoded strings.","required":["byteStart","byteEnd"],"properties":{"byteStart":{"type":"integer","minimum":0},"byteEnd":{"type":"integer","minimum":0}}}'
]

{ #category : #serialization }
AppBskyRichtextFacetByteSlice class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpByteStart: (aRequest at: 'byteStart' ifAbsent: [ nil ]);
		atpByteEnd: (aRequest at: 'byteEnd' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteEnd [
	<atpType:#Number format:nil>
	^ atpByteEnd
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteEnd: anObject [
	atpByteEnd := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteStart [
	<atpType:#Number format:nil>
	^ atpByteStart
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteStart: anObject [
	atpByteStart := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetByteSlice >> byteEndDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ByteEnd';
		accessor: #atpByteEnd;
		beRequired
]

{ #category : #magritte }
AppBskyRichtextFacetByteSlice >> byteStartDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ByteStart';
		accessor: #atpByteStart;
		beRequired
]
