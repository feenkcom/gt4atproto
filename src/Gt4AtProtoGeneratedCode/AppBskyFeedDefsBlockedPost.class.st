Class {
	#name : #AppBskyFeedDefsBlockedPost,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoBlocked'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atProtoBlocked [
	^ atProtoBlocked
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atProtoBlocked: anObject [
	atProtoBlocked := anObject
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> blockedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Blocked';
		accessor: #atProtoBlocked;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
