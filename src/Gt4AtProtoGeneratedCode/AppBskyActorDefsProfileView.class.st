Class {
	#name : #AppBskyActorDefsProfileView,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyActorDefsProfileView',
	#classTraits : 'TAppBskyActorDefsProfileView classTrait',
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpDisplayName',
		'atpDescription',
		'atpAvatar',
		'atpIndexedAt',
		'atpViewer',
		'atpLabels',
		'atpAssociated',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsProfileView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyActorDefsProfileView class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsProfileView class >> atpRecordName [
 ^ 'app.bsky.actor.defs#profileView'
]

{ #category : #accessing }
AppBskyActorDefsProfileView class >> atpSchema [
 ^ '{"type":"object","required":["did","handle"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"displayName":{"type":"string","maxGraphemes":64,"maxLength":640},"description":{"type":"string","maxGraphemes":256,"maxLength":2560},"avatar":{"type":"string"},"indexedAt":{"type":"string","format":"datetime"},"viewer":{"type":"ref","ref":"#viewerState"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsProfileView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
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

{ #category : #magritte }
AppBskyActorDefsProfileView >> associatedDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Associated';
		accessor: #atpAssociated
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAssociated [
	<referenceTo:'#profileAssociated'>
	<atpType:#AppBskyActorDefsProfileAssociated format:nil>
	^ atpAssociated
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAssociated: anObject [
	<referenceTo:'#profileAssociated'>
	atpAssociated := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAvatar [
	<atpType:#String format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpViewer [
	<referenceTo:'#viewerState'>
	<atpType:#AppBskyActorDefsViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpViewer: anObject [
	<referenceTo:'#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
