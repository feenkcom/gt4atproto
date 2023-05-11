Class {
	#name : #AppBskyRichtextFacetByteSlice,
	#superclass : #Object,
	#instVars : [
		'atProtoByteStart',
		'atProtoByteEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyRichtextFacetByteSlice class >> fromRequest: aRequest [
	^ self new atProtoByteStart: (aRequest at: 'byteStart' ifAbsent: [ nil ]); 
		atProtoByteEnd: (aRequest at: 'byteEnd' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atProtoByteEnd [
	^ atProtoByteEnd
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atProtoByteEnd: anObject [
	atProtoByteEnd := anObject
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atProtoByteStart [
	^ atProtoByteStart
]

{ #category : #accessing }
AppBskyRichtextFacetByteSlice >> atProtoByteStart: anObject [
	atProtoByteStart := anObject
]

{ #category : #magritte }
AppBskyRichtextFacetByteSlice >> byteEndDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ByteEnd';
		accessor: #atProtoByteEnd;
	beRequired
]

{ #category : #magritte }
AppBskyRichtextFacetByteSlice >> byteStartDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ByteStart';
		accessor: #atProtoByteStart;
	beRequired
]
