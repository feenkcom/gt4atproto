Class {
	#name : #AppBskyGraphDefsNotFoundActor,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpActor',
		'atpNotFound'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor class >> atpDescription [
 ^  'indicates that a handle or DID could not be resolved'
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor class >> atpFile [
 ^ 'app/bsky/graph/defs.json'
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor class >> atpRecordName [
 ^ 'app.bsky.graph.defs#notFoundActor'
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor class >> atpSchema [
 ^ '{"type":"object","description":"indicates that a handle or DID could not be resolved","required":["actor","notFound"],"properties":{"actor":{"type":"string","format":"at-identifier"},"notFound":{"type":"boolean","const":true}}}'
]

{ #category : #serialization }
AppBskyGraphDefsNotFoundActor class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpActor: (aRequest at: 'actor' ifAbsent: [ nil ]);
		atpNotFound: (aRequest at: 'notFound' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyGraphDefsNotFoundActor >> actorDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Actor';
		accessor: #atpActor;
		beRequired
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor >> atpActor [
	<atpType:#String format:'at-identifier'>
	^ atpActor
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor >> atpActor: anObject [
	atpActor := anObject
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor >> atpNotFound [
	<atpType:#Boolean format:nil>
	^ atpNotFound
]

{ #category : #accessing }
AppBskyGraphDefsNotFoundActor >> atpNotFound: anObject [
	atpNotFound := anObject
]

{ #category : #magritte }
AppBskyGraphDefsNotFoundActor >> notFoundDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'NotFound';
		accessor: #atpNotFound;
		beRequired
]
