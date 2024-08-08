Class {
	#name : #AppBskyGraphDefsStarterPackViewBasic,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpRecord',
		'atpCreator',
		'atpListItemCount',
		'atpJoinedWeekCount',
		'atpJoinedAllTimeCount',
		'atpLabels',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic class >> atpRecordName [
 ^ 'app.bsky.graph.defs#starterPackViewBasic'
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","record","creator","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"record":{"type":"unknown"},"creator":{"type":"ref","ref":"app.bsky.actor.defs#profileViewBasic"},"listItemCount":{"type":"integer","minimum":0},"joinedWeekCount":{"type":"integer","minimum":0},"joinedAllTimeCount":{"type":"integer","minimum":0},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsStarterPackViewBasic class >> fromRequest: aRequest [
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
		atpListItemCount: (aRequest at: 'listItemCount' ifAbsent: [ nil ]);
		atpJoinedWeekCount: (aRequest at: 'joinedWeekCount' ifAbsent: [ nil ]);
		atpJoinedAllTimeCount: (aRequest at: 'joinedAllTimeCount' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	<atpType:#AppBskyActorDefsProfileViewBasic format:nil>
	^ atpCreator
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpJoinedAllTimeCount [
	<atpType:#Number format:nil>
	^ atpJoinedAllTimeCount
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpJoinedAllTimeCount: anObject [
	atpJoinedAllTimeCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpJoinedWeekCount [
	<atpType:#Number format:nil>
	^ atpJoinedWeekCount
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpJoinedWeekCount: anObject [
	atpJoinedWeekCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpListItemCount [
	<atpType:#Number format:nil>
	^ atpListItemCount
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpListItemCount: anObject [
	atpListItemCount := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpRecord [
	<atpType:#Object format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyGraphDefsStarterPackViewBasic >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> joinedAllTimeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'JoinedAllTimeCount';
		accessor: #atpJoinedAllTimeCount
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> joinedWeekCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'JoinedWeekCount';
		accessor: #atpJoinedWeekCount
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> listItemCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ListItemCount';
		accessor: #atpListItemCount
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]

{ #category : #magritte }
AppBskyGraphDefsStarterPackViewBasic >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
