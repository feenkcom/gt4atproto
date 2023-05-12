Class {
	#name : #AppBskyGraphDefsListViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpMuted'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState class >> atpRecordName [
 ^ 'app.bsky.graph.defs#listViewerState'
]

{ #category : #serialization }
AppBskyGraphDefsListViewerState class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpMuted [
	^ atpMuted
]

{ #category : #accessing }
AppBskyGraphDefsListViewerState >> atpMuted: anObject [
	atpMuted := anObject
]

{ #category : #magritte }
AppBskyGraphDefsListViewerState >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atpMuted
]
