Class {
	#name : #AppBskyActorProfileMain,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyActorProfileMain',
	#classTraits : 'TAppBskyActorProfileMain classTrait',
	#instVars : [
		'atpDisplayName',
		'atpDescription',
		'atpAvatar',
		'atpBanner',
		'atpLabels',
		'atpJoinedViaStarterPack',
		'atpPinnedPost',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorProfileMain class >> atpDescription [
 ^  'A declaration of a Bluesky account profile.'
]

{ #category : #accessing }
AppBskyActorProfileMain class >> atpFile [
 ^ 'app/bsky/actor/profile.json'
]

{ #category : #accessing }
AppBskyActorProfileMain class >> atpRecordName [
 ^ 'app.bsky.actor.profile'
]

{ #category : #accessing }
AppBskyActorProfileMain class >> atpSchema [
 ^ '{"type":"record","description":"A declaration of a Bluesky account profile.","key":"literal:self","record":{"type":"object","properties":{"displayName":{"type":"string","maxGraphemes":64,"maxLength":640},"description":{"type":"string","description":"Free-form profile description text.","maxGraphemes":256,"maxLength":2560},"avatar":{"type":"blob","description":"Small image to be displayed next to posts from account. AKA, ''profile picture''","accept":["image/png","image/jpeg"],"maxSize":1000000},"banner":{"type":"blob","description":"Larger horizontal image to display behind profile view.","accept":["image/png","image/jpeg"],"maxSize":1000000},"labels":{"type":"union","description":"Self-label values, specific to the Bluesky application, on the overall account.","refs":["com.atproto.label.defs#selfLabels"]},"joinedViaStarterPack":{"type":"ref","ref":"com.atproto.repo.strongRef"},"pinnedPost":{"type":"ref","ref":"com.atproto.repo.strongRef"},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyActorProfileMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpBanner: (aRequest at: 'banner' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :aValue | 
					({'com.atproto.label.defs#selfLabels' -> ComAtprotoLabelDefsSelfLabels}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpJoinedViaStarterPack: (aRequest
				at: 'joinedViaStarterPack'
				ifPresent: [ :aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpPinnedPost: (aRequest
				at: 'pinnedPost'
				ifPresent: [ :aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpAvatar [
	<atpType:#ByteArray format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpBanner [
	<atpType:#ByteArray format:nil>
	^ atpBanner
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpBanner: anObject [
	atpBanner := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpJoinedViaStarterPack [
	<referenceTo:'com.atproto.repo.strongRef'>
	<atpType:#ComAtprotoRepoStrongRefMain format:nil>
	^ atpJoinedViaStarterPack
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpJoinedViaStarterPack: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpJoinedViaStarterPack := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpLabels [
	<atpType:#(ComAtprotoLabelDefsSelfLabels) format:nil>
	^ atpLabels
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpPinnedPost [
	<referenceTo:'com.atproto.repo.strongRef'>
	<atpType:#ComAtprotoRepoStrongRefMain format:nil>
	^ atpPinnedPost
]

{ #category : #accessing }
AppBskyActorProfileMain >> atpPinnedPost: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpPinnedPost := anObject
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
AppBskyActorProfileMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
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

{ #category : #magritte }
AppBskyActorProfileMain >> joinedViaStarterPackDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'JoinedViaStarterPack';
		accessor: #atpJoinedViaStarterPack
]

{ #category : #magritte }
AppBskyActorProfileMain >> labelsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.label.defs#selfLabels'};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyActorProfileMain >> pinnedPostDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'PinnedPost';
		accessor: #atpPinnedPost
]
