Class {
	#name : #AppBskyActorDefsProfileViewDetailed,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHandle',
		'atProtoDisplayName',
		'atProtoDescription',
		'atProtoAvatar',
		'atProtoBanner',
		'atProtoFollowersCount',
		'atProtoFollowsCount',
		'atProtoPostsCount',
		'atProtoIndexedAt',
		'atProtoViewer',
		'atProtoLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoAvatar [
	^ atProtoAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoAvatar: anObject [
	atProtoAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoBanner [
	^ atProtoBanner
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoBanner: anObject [
	atProtoBanner := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDescription [
	^ atProtoDescription
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDescription: anObject [
	atProtoDescription := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDisplayName [
	^ atProtoDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoDisplayName: anObject [
	atProtoDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoFollowersCount [
	^ atProtoFollowersCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoFollowersCount: anObject [
	atProtoFollowersCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoFollowsCount [
	^ atProtoFollowsCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoFollowsCount: anObject [
	atProtoFollowsCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoPostsCount [
	^ atProtoPostsCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoPostsCount: anObject [
	atProtoPostsCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoViewer [
	<referenceTo:'#viewerState'>
	^ atProtoViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atProtoViewer: anObject [
	<referenceTo:'#viewerState'>
	atProtoViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atProtoAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> bannerDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Banner';
		accessor: #atProtoBanner
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atProtoDescription
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atProtoDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> followersCountDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'FollowersCount';
		accessor: #atProtoFollowersCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> followsCountDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'FollowsCount';
		accessor: #atProtoFollowsCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> postsCountDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'PostsCount';
		accessor: #atProtoPostsCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atProtoViewer
]
