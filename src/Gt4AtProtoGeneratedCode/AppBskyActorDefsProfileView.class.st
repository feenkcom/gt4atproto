Class {
	#name : #AppBskyActorDefsProfileView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpDisplayName',
		'atpDescription',
		'atpAvatar',
		'atpIndexedAt',
		'atpViewer',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

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
		atpViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyActorDefsViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDescription [
	^ atpDescription
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDid [
	^ atpDid
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDisplayName [
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpHandle [
	^ atpHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileView >> atpViewer [
	<referenceTo:'#viewerState'>
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
