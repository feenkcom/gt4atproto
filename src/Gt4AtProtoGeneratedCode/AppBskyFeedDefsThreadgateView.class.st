Class {
	#name : #AppBskyFeedDefsThreadgateView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpRecord',
		'atpLists'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsThreadgateView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView class >> atpRecordName [
 ^ 'app.bsky.feed.defs#threadgateView'
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView class >> atpSchema [
 ^ '{"type":"object","properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"record":{"type":"unknown"},"lists":{"type":"array","items":{"type":"ref","ref":"app.bsky.graph.defs#listViewBasic"}}}}'
]

{ #category : #serialization }
AppBskyFeedDefsThreadgateView class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpLists: (aRequest
				at: 'lists'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyGraphDefsListViewBasic fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpLists [
	<atpType:#AppBskyGraphDefsListViewBasic format:nil>
	<atpCollection>
	^ atpLists
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpLists: anObject [
	atpLists := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpRecord [
	<atpType:#Object format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsThreadgateView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsThreadgateView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid
]

{ #category : #magritte }
AppBskyFeedDefsThreadgateView >> listsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyGraphDefsListViewBasic};
		label: 'Lists';
		accessor: #atpLists
]

{ #category : #magritte }
AppBskyFeedDefsThreadgateView >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atpRecord
]

{ #category : #magritte }
AppBskyFeedDefsThreadgateView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri
]
