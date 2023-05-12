Class {
	#name : #AppBskyGraphDefsListViewBasic,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpName',
		'atpPurpose',
		'atpAvatar',
		'atpViewer',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyGraphDefsListViewBasic class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpPurpose: (aRequest at: 'purpose' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atpViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyGraphDefsListViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpName [
	^ atpName
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpPurpose [
	<referenceTo:'#listPurpose'>
	^ atpPurpose
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpPurpose: anObject [
	<referenceTo:'#listPurpose'>
	atpPurpose := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpViewer [
	<referenceTo:'#listViewerState'>
	^ atpViewer
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpViewer: anObject [
	<referenceTo:'#listViewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
	beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> purposeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Purpose';
		accessor: #atpPurpose;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
