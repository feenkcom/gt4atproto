Class {
	#name : #AppBskyLabelerDefsLabelerView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpCreator',
		'atpLikeCount',
		'atpViewer',
		'atpIndexedAt',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyLabelerDefsLabelerView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView class >> atpFile [
 ^ 'app/bsky/labeler/defs.json'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView class >> atpRecordName [
 ^ 'app.bsky.labeler.defs#labelerView'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","creator","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"creator":{"type":"ref","ref":"app.bsky.actor.defs#profileView"},"likeCount":{"type":"integer","minimum":0},"viewer":{"type":"ref","ref":"#labelerViewerState"},"indexedAt":{"type":"string","format":"datetime"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyLabelerDefsLabelerView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpCreator: (aRequest
				at: 'creator'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyLabelerDefsLabelerViewerState fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	<atpType:#AppBskyActorDefsProfileView format:nil>
	^ atpCreator
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpLikeCount [
	<atpType:#Number format:nil>
	^ atpLikeCount
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpLikeCount: anObject [
	atpLikeCount := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpViewer [
	<referenceTo:'#labelerViewerState'>
	<atpType:#AppBskyLabelerDefsLabelerViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerView >> atpViewer: anObject [
	<referenceTo:'#labelerViewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> likeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'LikeCount';
		accessor: #atpLikeCount
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
