Class {
	#name : #AppBskyRichtextFacetByteSlice,
	#superclass : #Object,
	#instVars : [
		'atProtoByteStart',
		'atProtoByteEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

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
	^ MABooleanDescription new
		label: 'ByteEnd';
		accessor: #atProtoByteEnd;
	beRequired
]

{ #category : #magritte }
AppBskyRichtextFacetByteSlice >> byteStartDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'ByteStart';
		accessor: #atProtoByteStart;
	beRequired
]
