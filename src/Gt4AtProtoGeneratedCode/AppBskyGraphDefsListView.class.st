Class {
	#name : #AppBskyGraphDefsListView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCreator',
		'atpName',
		'atpPurpose',
		'atpDescription',
		'atpDescriptionFacets',
		'atpAvatar',
		'atpViewer',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListView class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listView'
]

{ #category : #serialization }
AppBskyGraphDefsListView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCreator: (aRequest at: 'creator' ifPresent: [:aValue | AppBskyActorDefsProfileView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpPurpose: (aRequest at: 'purpose' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atpDescriptionFacets: (aRequest at: 'descriptionFacets' ifPresent: [:anArray | anArray collect: [:aValue |AppBskyRichtextFacetMain fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atpViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyGraphDefsListViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	^ atpCreator
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpDescription [
	^ atpDescription
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpDescriptionFacets [
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpName [
	^ atpName
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpPurpose [
	<referenceTo:'#listPurpose'>
	^ atpPurpose
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpPurpose: anObject [
	<referenceTo:'#listPurpose'>
	atpPurpose := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpViewer [
	<referenceTo:'#listViewerState'>
	^ atpViewer
]

{ #category : #accessing }
AppBskyGraphDefsListView >> atpViewer: anObject [
	<referenceTo:'#listViewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListView >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyGraphDefsListView >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListView >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyGraphDefsListView >> descriptionFacetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'DescriptionFacets';
		accessor: #atpDescriptionFacets
]

{ #category : #magritte }
AppBskyGraphDefsListView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
	beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListView >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
	beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListView >> purposeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Purpose';
		accessor: #atpPurpose;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
