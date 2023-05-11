Class {
	#name : #AppBskyActorDefsProfileViewBasic,
	#superclass : #Object,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpDisplayName',
		'atpAvatar',
		'atpViewer',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyActorDefsProfileViewBasic class >> fromRequest: aRequest [
	^ self new atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]); 
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atpViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyActorDefsViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpDid [
	^ atpDid
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpDisplayName [
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpHandle [
	^ atpHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpViewer [
	<referenceTo:'#viewerState'>
	^ atpViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atpViewer: anObject [
	<referenceTo:'#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
