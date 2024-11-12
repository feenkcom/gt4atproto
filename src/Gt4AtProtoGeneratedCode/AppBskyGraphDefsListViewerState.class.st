Class {
	#name : #AppBskyGraphDefsListViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpMuted',
		'atpBlocked'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listViewerState'
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpSchema [
 ^ '{"type":"object","properties":{"muted":{"type":"boolean"},"blocked":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyGraphDefsListViewerState class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ]);
		atpBlocked: (aRequest at: 'blocked' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpBlocked [
	<atpType:#String format:'at-uri'>
	^ atpBlocked
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpBlocked: anObject [
	atpBlocked := anObject
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpMuted [
	<atpType:#Boolean format:nil>
	^ atpMuted
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpMuted: anObject [
	atpMuted := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListViewerState >> blockedDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Blocked';
		accessor: #atpBlocked
]

{ #category : #magritte }
AppBskyGraphDefsListViewerState >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atpMuted
]
