Class {
	#name : #AppBskyActorDefsProfileViewBasic,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHandle',
		'atProtoDisplayName',
		'atProtoAvatar',
		'atProtoViewer',
		'atProtoLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyActorDefsProfileViewBasic class >> fromRequest: aRequest [
	^ self new atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atProtoHandle: (aRequest at: 'handle' ifAbsent: [ nil ]); 
		atProtoDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]); 
		atProtoAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atProtoViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyActorDefsViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoAvatar [
	^ atProtoAvatar
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoAvatar: anObject [
	atProtoAvatar := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoDisplayName [
	^ atProtoDisplayName
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoDisplayName: anObject [
	atProtoDisplayName := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoHandle [
	^ atProtoHandle
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoHandle: anObject [
	atProtoHandle := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoViewer [
	<referenceTo:'#viewerState'>
	^ atProtoViewer
]

{ #category : #accessing }
AppBskyActorDefsProfileViewBasic >> atProtoViewer: anObject [
	<referenceTo:'#viewerState'>
	atProtoViewer := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atProtoAvatar
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atProtoDisplayName
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atProtoHandle;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyActorDefsProfileViewBasic >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atProtoViewer
]
