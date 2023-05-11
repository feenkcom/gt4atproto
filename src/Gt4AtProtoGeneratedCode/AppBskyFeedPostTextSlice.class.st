Class {
	#name : #AppBskyFeedPostTextSlice,
	#superclass : #Object,
	#instVars : [
		'atpStart',
		'atpEnd'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostTextSlice class >> fromRequest: aRequest [
	^ self new atpStart: (aRequest at: 'start' ifAbsent: [ nil ]); 
		atpEnd: (aRequest at: 'end' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpEnd [
	^ atpEnd
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpEnd: anObject [
	atpEnd := anObject
]

{ #category : #accessing }
AppBskyFeedPostTextSlice >> atpStart [
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
