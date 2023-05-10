Class {
	#name : #AppBskyActorDefsProfileView,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHandle',
		'atProtoDisplayName',
		'atProtoDescription',
		'atProtoAvatar',
		'atProtoIndexedAt',
		'atProtoViewer',
		'atProtoLabels'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoAvatar [
	^ atProtoAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoAvatar: anObject [
	atProtoAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDescription [
	^ atProtoDescription
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDescription: anObject [
	atProtoDescription := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDisplayName [
	^ atProtoDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoDisplayName: anObject [
	atProtoDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoViewer [
	<referenceTo:'#viewerState'>
	^ atProtoViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atProtoViewer: anObject [
	<referenceTo:'#viewerState'>
	atProtoViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atProtoAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atProtoDescription
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atProtoDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atProtoViewer
]
