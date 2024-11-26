Class {
	#name : #AppBskyLabelerDefsLabelerViewDetailed,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpCreator',
		'atpPolicies',
		'atpLikeCount',
		'atpViewer',
		'atpIndexedAt',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed class >> atpFile [
 ^ 'app/bsky/labeler/defs.json'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed class >> atpRecordName [
 ^ 'app.bsky.labeler.defs#labelerViewDetailed'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","creator","policies","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"creator":{"type":"ref","ref":"app.bsky.actor.defs#profileView"},"policies":{"type":"ref","ref":"app.bsky.labeler.defs#labelerPolicies"},"likeCount":{"type":"integer","minimum":0},"viewer":{"type":"ref","ref":"#labelerViewerState"},"indexedAt":{"type":"string","format":"datetime"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyLabelerDefsLabelerViewDetailed class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpCreator: (aRequest
				at: 'creator'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpPolicies: (aRequest
				at: 'policies'
				ifPresent: [ :aValue | AppBskyLabelerDefsLabelerPolicies fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyLabelerDefsLabelerViewerState fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	<atpType:#AppBskyActorDefsProfileView format:nil>
	^ atpCreator
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpLikeCount [
	<atpType:#Number format:nil>
	^ atpLikeCount
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpLikeCount: anObject [
	atpLikeCount := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpPolicies [
	<referenceTo:'app.bsky.labeler.defs#labelerPolicies'>
	<atpType:#AppBskyLabelerDefsLabelerPolicies format:nil>
	^ atpPolicies
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpPolicies: anObject [
	<referenceTo:'app.bsky.labeler.defs#labelerPolicies'>
	atpPolicies := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpViewer [
	<referenceTo:'#labelerViewerState'>
	<atpType:#AppBskyLabelerDefsLabelerViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerViewDetailed >> atpViewer: anObject [
	<referenceTo:'#labelerViewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> likeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'LikeCount';
		accessor: #atpLikeCount
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> policiesDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Policies';
		accessor: #atpPolicies;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerViewDetailed >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
