Class {
	#name : #AppBskyFeedDefsNotFoundPost,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoNotFound'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atProtoNotFound [
	^ atProtoNotFound
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atProtoNotFound: anObject [
	atProtoNotFound := anObject
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> notFoundDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'NotFound';
		accessor: #atProtoNotFound;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
