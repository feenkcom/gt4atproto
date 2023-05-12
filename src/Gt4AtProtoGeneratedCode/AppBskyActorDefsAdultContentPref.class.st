Class {
	#name : #AppBskyActorDefsAdultContentPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpEnabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsAdultContentPref class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyActorDefsAdultContentPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#adultContentPref'
]

{ #category : #accessing }
AppBskyActorDefsAdultContentPref class >> atpSchema [
 ^ '{"type":"object","required":["enabled"],"properties":{"enabled":{"type":"boolean","default":false}}}'
]

{ #category : #serialization }
AppBskyActorDefsAdultContentPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpEnabled: (aRequest at: 'enabled' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsAdultContentPref >> atpEnabled [
	^ atpEnabled
]

{ #category : #accessing }
AppBskyActorDefsAdultContentPref >> atpEnabled: anObject [
	atpEnabled := anObject
]

{ #category : #magritte }
AppBskyActorDefsAdultContentPref >> enabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Enabled';
		accessor: #atpEnabled;
	beRequired
]
