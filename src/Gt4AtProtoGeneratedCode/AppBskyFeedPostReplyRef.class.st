Class {
	#name : #AppBskyFeedPostReplyRef,
	#superclass : #Object,
	#instVars : [
		'atProtoRoot',
		'atProtoParent'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostReplyRef class >> fromRequest: aRequest [
	^ self new atProtoRoot: (ComAtprotoRepoStrongRefMain fromRequest: (aRequest at: 'root' ifAbsent: [ nil ])); 
		atProtoParent: (ComAtprotoRepoStrongRefMain fromRequest: (aRequest at: 'parent' ifAbsent: [ nil ]))
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atProtoParent [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atProtoParent
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atProtoParent: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atProtoParent := anObject
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atProtoRoot [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atProtoRoot
]

{ #category : #accessing }
AppBskyFeedPostReplyRef >> atProtoRoot: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atProtoRoot := anObject
]

{ #category : #magritte }
AppBskyFeedPostReplyRef >> parentDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Parent';
		accessor: #atProtoParent;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostReplyRef >> rootDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Root';
		accessor: #atProtoRoot;
		beRequired
]
