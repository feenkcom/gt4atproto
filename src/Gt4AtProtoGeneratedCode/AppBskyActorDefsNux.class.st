Class {
	#name : #AppBskyActorDefsNux,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpCompleted',
		'atpData',
		'atpExpiresAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsNux class >> atpDescription [
 ^  'A new user experiences (NUX) storage object'
]

{ #category : #accessing }
AppBskyActorDefsNux class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsNux class >> atpRecordName [
 ^ 'app.bsky.actor.defs#nux'
]

{ #category : #accessing }
AppBskyActorDefsNux class >> atpSchema [
 ^ '{"type":"object","description":"A new user experiences (NUX) storage object","required":["id","completed"],"properties":{"id":{"type":"string","maxLength":100},"completed":{"type":"boolean","default":false},"data":{"description":"Arbitrary data for the NUX. The structure is defined by the NUX itself. Limited to 300 characters.","type":"string","maxLength":3000,"maxGraphemes":300},"expiresAt":{"type":"string","format":"datetime","description":"The date and time at which the NUX will expire and should be considered completed."}}}'
]

{ #category : #serialization }
AppBskyActorDefsNux class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpCompleted: (aRequest at: 'completed' ifAbsent: [ nil ]);
		atpData: (aRequest at: 'data' ifAbsent: [ nil ]);
		atpExpiresAt: (aRequest at: 'expiresAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpCompleted [
	<atpType:#Boolean format:nil>
	^ atpCompleted
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpCompleted: anObject [
	atpCompleted := anObject
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpData [
	<atpType:#String format:nil>
	^ atpData
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpData: anObject [
	atpData := anObject
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpExpiresAt [
	<atpType:#String format:'datetime'>
	^ atpExpiresAt
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpExpiresAt: anObject [
	atpExpiresAt := anObject
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
AppBskyActorDefsNux >> atpId: anObject [
	atpId := anObject
]

{ #category : #magritte }
AppBskyActorDefsNux >> completedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Completed';
		accessor: #atpCompleted;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsNux >> dataDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Data';
		accessor: #atpData
]

{ #category : #magritte }
AppBskyActorDefsNux >> expiresAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ExpiresAt';
		accessor: #atpExpiresAt
]

{ #category : #magritte }
AppBskyActorDefsNux >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]
