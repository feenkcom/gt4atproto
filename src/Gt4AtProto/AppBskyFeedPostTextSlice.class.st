Class {
	#name : #AppBskyFeedPostTextSlice,
	#superclass : #Object,
	#instVars : [
		'atProtoStart',
		'atProtoEnd'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atProtoEnd [
	^ atProtoEnd
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atProtoEnd: anObject [
	atProtoEnd := anObject
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atProtoStart [
	^ atProtoStart
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atProtoStart: anObject [
	atProtoStart := anObject
]

{ #category : #magritte }
AppBskyFeedPostTextSlice >> endDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'End';
		accessor: #atProtoEnd;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostTextSlice >> startDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Start';
		accessor: #atProtoStart;
	beRequired
]
