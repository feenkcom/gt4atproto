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
 ^  'Specifies the sub-string range a facet feature applies to. Start index is inclusive, end index is exclusive. Indices are zero-indexed, counting bytes of the UTF-8 encoded text. NOTE: some languages, like Javascript, use UTF-16 or Unicode codepoints for string slice indexing; in these languages, convert to byte arrays before working with facets.'
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
 ^ '{"type":"object","description":"Specifies the sub-string range a facet feature applies to. Start index is inclusive, end index is exclusive. Indices are zero-indexed, counting bytes of the UTF-8 encoded text. NOTE: some languages, like Javascript, use UTF-16 or Unicode codepoints for string slice indexing; in these languages, convert to byte arrays before working with facets.","required":["byteStart","byteEnd"],"properties":{"byteStart":{"type":"integer","minimum":0},"byteEnd":{"type":"integer","minimum":0}}}'
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
