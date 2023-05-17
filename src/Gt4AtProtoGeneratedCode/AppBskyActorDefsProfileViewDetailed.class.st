Class {
	#name : #AppBskyActorDefsProfileViewDetailed,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyActorDefsProfileViewDetailed',
	#classTraits : 'TAppBskyActorDefsProfileViewDetailed classTrait',
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpDisplayName',
		'atpDescription',
		'atpAvatar',
		'atpBanner',
		'atpFollowersCount',
		'atpFollowsCount',
		'atpPostsCount',
		'atpIndexedAt',
		'atpViewer',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed class >> atpRecordName [
 ^ 'app.bsky.actor.defs#profileViewDetailed'
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed class >> atpSchema [
 ^ '{"type":"object","required":["did","handle"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"displayName":{"type":"string","maxGraphemes":64,"maxLength":640},"description":{"type":"string","maxGraphemes":256,"maxLength":2560},"avatar":{"type":"string"},"banner":{"type":"string"},"followersCount":{"type":"integer"},"followsCount":{"type":"integer"},"postsCount":{"type":"integer"},"indexedAt":{"type":"string","format":"datetime"},"viewer":{"type":"ref","ref":"#viewerState"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsProfileViewDetailed class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpBanner: (aRequest at: 'banner' ifAbsent: [ nil ]);
		atpFollowersCount: (aRequest at: 'followersCount' ifAbsent: [ nil ]);
		atpFollowsCount: (aRequest at: 'followsCount' ifAbsent: [ nil ]);
		atpPostsCount: (aRequest at: 'postsCount' ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyActorDefsViewerState fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpAvatar [
	<atpType:#String format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpBanner [
	<atpType:#String format:nil>
	^ atpBanner
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpBanner: anObject [
	atpBanner := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpFollowersCount [
	<atpType:#Number format:nil>
	^ atpFollowersCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpFollowersCount: anObject [
	atpFollowersCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpFollowsCount [
	<atpType:#Number format:nil>
	^ atpFollowsCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpFollowsCount: anObject [
	atpFollowsCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpPostsCount [
	<atpType:#Number format:nil>
	^ atpPostsCount
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpPostsCount: anObject [
	atpPostsCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpViewer [
	<referenceTo:'#viewerState'>
	<atpType:#AppBskyActorDefsViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileViewDetailed >> atpViewer: anObject [
	<referenceTo:'#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> bannerDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Banner';
		accessor: #atpBanner
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> followersCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'FollowersCount';
		accessor: #atpFollowersCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> followsCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'FollowsCount';
		accessor: #atpFollowsCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> postsCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'PostsCount';
		accessor: #atpPostsCount
]

{ #category : #magritte }
AppBskyActorDefsProfileViewDetailed >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
