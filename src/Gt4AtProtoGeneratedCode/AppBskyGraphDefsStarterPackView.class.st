Class {
	#name : #AppBskyGraphDefsStarterPackView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpRecord',
		'atpCreator',
		'atpList',
		'atpListItemsSample',
		'atpFeeds',
		'atpJoinedWeekCount',
		'atpJoinedAllTimeCount',
		'atpLabels',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsStarterPackView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView class >> atpRecordName [
 ^ 'app.bsky.graph.defs#starterPackView'
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","record","creator","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"record":{"type":"unknown"},"creator":{"type":"ref","ref":"app.bsky.actor.defs#profileViewBasic"},"list":{"type":"ref","ref":"#listViewBasic"},"listItemsSample":{"type":"array","maxLength":12,"items":{"type":"ref","ref":"#listItemView"}},"feeds":{"type":"array","maxLength":3,"items":{"type":"ref","ref":"app.bsky.feed.defs#generatorView"}},"joinedWeekCount":{"type":"integer","minimum":0},"joinedAllTimeCount":{"type":"integer","minimum":0},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsStarterPackView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue ]
				ifAbsent: [ nil ]);
		atpCreator: (aRequest
				at: 'creator'
				ifPresent: [ :aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpList: (aRequest
				at: 'list'
				ifPresent: [ :aValue | AppBskyGraphDefsListViewBasic fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpListItemsSample: (aRequest
				at: 'listItemsSample'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyGraphDefsListItemView fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpFeeds: (aRequest
				at: 'feeds'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyFeedDefsGeneratorView fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpJoinedWeekCount: (aRequest at: 'joinedWeekCount' ifAbsent: [ nil ]);
		atpJoinedAllTimeCount: (aRequest at: 'joinedAllTimeCount' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	<atpType:#AppBskyActorDefsProfileViewBasic format:nil>
	^ atpCreator
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpFeeds [
	<atpType:#AppBskyFeedDefsGeneratorView format:nil>
	<atpCollection>
	^ atpFeeds
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpFeeds: anObject [
	atpFeeds := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpJoinedAllTimeCount [
	<atpType:#Number format:nil>
	^ atpJoinedAllTimeCount
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpJoinedAllTimeCount: anObject [
	atpJoinedAllTimeCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpJoinedWeekCount [
	<atpType:#Number format:nil>
	^ atpJoinedWeekCount
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpJoinedWeekCount: anObject [
	atpJoinedWeekCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpList [
	<referenceTo:'#listViewBasic'>
	<atpType:#AppBskyGraphDefsListViewBasic format:nil>
	^ atpList
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpList: anObject [
	<referenceTo:'#listViewBasic'>
	atpList := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpListItemsSample [
	<atpType:#AppBskyGraphDefsListItemView format:nil>
	<atpCollection>
	^ atpListItemsSample
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpListItemsSample: anObject [
	atpListItemsSample := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpRecord [
	<atpType:#Object format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> feedsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyFeedDefsGeneratorView};
		label: 'Feeds';
		accessor: #atpFeeds
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> joinedAllTimeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'JoinedAllTimeCount';
		accessor: #atpJoinedAllTimeCount
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> joinedWeekCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'JoinedWeekCount';
		accessor: #atpJoinedWeekCount
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> listDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'List';
		accessor: #atpList
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> listItemsSampleDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyGraphDefsListItemView};
		label: 'ListItemsSample';
		accessor: #atpListItemsSample
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
