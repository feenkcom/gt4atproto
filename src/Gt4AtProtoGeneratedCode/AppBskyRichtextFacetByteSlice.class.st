Class {
	#name : #AppBskyRichtextFacetByteSlice,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpByteStart',
		'atpByteEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetByteSlice class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpByteStart: (aRequest at: 'byteStart' ifAbsent: [ nil ]); 
		atpByteEnd: (aRequest at: 'byteEnd' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteEnd [
	^ atpByteEnd
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteEnd: anObject [
	atpByteEnd := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atpByteStart [
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
