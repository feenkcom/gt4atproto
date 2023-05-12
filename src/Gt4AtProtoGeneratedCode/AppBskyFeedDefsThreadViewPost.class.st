Class {
	#name : #AppBskyFeedDefsThreadViewPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPost',
		'atpParent',
		'atpReplies'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsThreadViewPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest at: 'post' ifPresent: [:aValue | AppBskyFeedDefsPostView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpParent: (aRequest at: 'parent' ifAbsent: [ nil ]); 
		atpReplies: (aRequest at: 'replies' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpParent [
	^ atpParent
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpParent: anObject [
	atpParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpPost [
	<referenceTo:'#postView'>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpPost: anObject [
	<referenceTo:'#postView'>
	atpPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpReplies [
	^ atpReplies
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpReplies: anObject [
	atpReplies := anObject
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> parentDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#threadViewPost'. '#notFoundPost'. '#blockedPost'};
		label: 'Parent';
		accessor: #atpParent
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> postDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> repliesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ThreadViewPost. NotFoundPost. BlockedPost};
		label: 'Replies';
		accessor: #atpReplies
]
