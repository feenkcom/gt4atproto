Class {
	#name : #AppBskyFeedPostTextSlice,
	#superclass : #Object,
	#instVars : [
		'atProtoStart',
		'atProtoEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostTextSlice class >> fromRequest: aRequest [
	^ self new atProtoStart: (aRequest at: 'start' ifAbsent: [ nil ]); 
		atProtoEnd: (aRequest at: 'end' ifAbsent: [ nil ])
]

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
	^ MANumberDescription new
		label: 'End';
		accessor: #atProtoEnd;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostTextSlice >> startDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Start';
		accessor: #atProtoStart;
	beRequired
]
