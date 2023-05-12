Class {
	#name : #AppBskyActorProfileMain,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyActorProfileMain',
	#classTraits : 'TAppBskyActorProfileMain classTrait',
	#instVars : [
		'atpDisplayName',
		'atpDescription',
		'atpAvatar',
		'atpBanner'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorProfileMain class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyActorProfileMain class >> atpRecordName [
 ^ 'app.bsky.actor.profile'
]

{ #category : #accessing }
AppBskyActorProfileMain class >> atpSchema [
 ^ '{"type":"record","key":"literal:self","record":{"type":"object","properties":{"displayName":{"type":"string","maxGraphemes":64,"maxLength":640},"description":{"type":"string","maxGraphemes":256,"maxLength":2560},"avatar":{"type":"blob","accept":["image/png","image/jpeg"],"maxSize":1000000},"banner":{"type":"blob","accept":["image/png","image/jpeg"],"maxSize":1000000}}}}'
]

{ #category : #serialization }
AppBskyActorProfileMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]); 
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atpBanner: (aRequest at: 'banner' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpBanner [
	^ atpBanner
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpBanner: anObject [
	atpBanner := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDescription [
	^ atpDescription
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDisplayName [
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #magritte }
AppBskyActorProfileMain >> avatarDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyActorProfileMain >> bannerDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Banner';
		accessor: #atpBanner
]

{ #category : #magritte }
AppBskyActorProfileMain >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyActorProfileMain >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName
]
