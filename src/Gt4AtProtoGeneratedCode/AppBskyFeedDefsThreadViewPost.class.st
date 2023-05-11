Class {
	#name : #AppBskyFeedDefsThreadViewPost,
	#superclass : #Object,
	#instVars : [
		'atProtoPost',
		'atProtoParent',
		'atProtoReplies'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsThreadViewPost class >> fromRequest: aRequest [
	^ self new atProtoPost: (aRequest at: 'post' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoParent: (aRequest at: 'parent' ifAbsent: [ nil ]); 
		atProtoReplies: (aRequest at: 'replies' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoParent [
	^ atProtoParent
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoParent: anObject [
	atProtoParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoPost [
	<referenceTo:'#postView'>
	^ atProtoPost
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoPost: anObject [
	<referenceTo:'#postView'>
	atProtoPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoReplies [
	^ atProtoReplies
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atProtoReplies: anObject [
	atProtoReplies := anObject
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> parentDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#threadViewPost'. '#notFoundPost'. '#blockedPost'};
		label: 'Parent';
		accessor: #atProtoParent
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> postDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Post';
		accessor: #atProtoPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> repliesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ThreadViewPost. NotFoundPost. BlockedPost};
		label: 'Replies';
		accessor: #atProtoReplies
]
