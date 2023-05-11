Class {
	#name : #AppBskyActorProfileMain,
	#superclass : #Object,
	#traits : 'TAppBskyActorProfileMain',
	#classTraits : 'TAppBskyActorProfileMain classTrait',
	#instVars : [
		'atProtoDisplayName',
		'atProtoDescription',
		'atProtoAvatar',
		'atProtoBanner'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyActorProfileMain class >> fromRequest: aRequest [
	^ self new atProtoDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]); 
		atProtoDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atProtoAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atProtoBanner: (aRequest at: 'banner' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoAvatar [
	^ atProtoAvatar
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoAvatar: anObject [
	atProtoAvatar := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoBanner [
	^ atProtoBanner
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoBanner: anObject [
	atProtoBanner := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoDescription [
	^ atProtoDescription
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoDescription: anObject [
	atProtoDescription := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoDisplayName [
	^ atProtoDisplayName
]

{ #category : #accessing }
AppBskyActorProfileMain >> atProtoDisplayName: anObject [
	atProtoDisplayName := anObject
]

{ #category : #magritte }
AppBskyActorProfileMain >> avatarDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Avatar';
		accessor: #atProtoAvatar
]

{ #category : #magritte }
AppBskyActorProfileMain >> bannerDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Banner';
		accessor: #atProtoBanner
]

{ #category : #magritte }
AppBskyActorProfileMain >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atProtoDescription
]

{ #category : #magritte }
AppBskyActorProfileMain >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atProtoDisplayName
]
