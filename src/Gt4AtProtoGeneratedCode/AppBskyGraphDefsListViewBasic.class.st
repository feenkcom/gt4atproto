Class {
	#name : #AppBskyGraphDefsListViewBasic,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpName',
		'atpPurpose',
		'atpAvatar',
		'atpListItemCount',
		'atpLabels',
		'atpViewer',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListViewBasic class >> atpDescription [
 ^  ''
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
 ^ '{"type":"object","required":["uri","cid","name","purpose"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"name":{"type":"string","maxLength":64,"minLength":1},"purpose":{"type":"ref","ref":"#listPurpose"},"avatar":{"type":"string","format":"uri"},"listItemCount":{"type":"integer","minimum":0},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"viewer":{"type":"ref","ref":"#listViewerState"},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsListViewBasic class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpPurpose: (aRequest at: 'purpose' ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpListItemCount: (aRequest at: 'listItemCount' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyGraphDefsListViewerState fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar [
	<atpType:#String format:'uri'>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpListItemCount [
	<atpType:#Number format:nil>
	^ atpListItemCount
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpListItemCount: anObject [
	atpListItemCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpPurpose [
	<referenceTo:'#listPurpose'>
	<atpType:#String format:nil>
	^ atpPurpose
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpPurpose: anObject [
	<referenceTo:'#listPurpose'>
	atpPurpose := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewBasic >> atpViewer [
	<referenceTo:'#listViewerState'>
	<atpType:#AppBskyGraphDefsListViewerState format:nil>
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
AppBskyGraphDefsListViewBasic >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyGraphDefsListViewBasic >> listItemCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ListItemCount';
		accessor: #atpListItemCount
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
