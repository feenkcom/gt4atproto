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

{ #category : #accessing }
AppBskyGraphDefsListViewBasic class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listViewBasic'
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic class >> atpSchema [
 ^ '{"type":"object","required":["uri","creator","name","purpose"],"properties":{"uri":{"type":"string","format":"at-uri"},"name":{"type":"string","maxLength":64,"minLength":1},"purpose":{"type":"ref","ref":"#listPurpose"},"avatar":{"type":"string"},"viewer":{"type":"ref","ref":"#listViewerState"},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsListViewBasic class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpPurpose: (aRequest
				at: 'purpose'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyGraphDefsListViewerState fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar [
	<atpType:'string' format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt [
	<atpType:'string' format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpName [
	<atpType:'string' format:nil>
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
	<atpType:'string' format:'at-uri'>
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
