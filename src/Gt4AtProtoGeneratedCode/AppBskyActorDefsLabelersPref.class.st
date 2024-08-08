Class {
	#name : #AppBskyActorDefsLabelersPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLabelers'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsLabelersPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsLabelersPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsLabelersPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#labelersPref'
]

{ #category : #accessing }
AppBskyActorDefsLabelersPref class >> atpSchema [
 ^ '{"type":"object","required":["labelers"],"properties":{"labelers":{"type":"array","items":{"type":"ref","ref":"#labelerPrefItem"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsLabelersPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpLabelers: (aRequest
				at: 'labelers'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyActorDefsLabelerPrefItem fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsLabelersPref >> atpLabelers [
	<atpType:#AppBskyActorDefsLabelerPrefItem format:nil>
	<atpCollection>
	^ atpLabelers
]

{ #category : #accessing }
AppBskyActorDefsLabelersPref >> atpLabelers: anObject [
	atpLabelers := anObject
]

{ #category : #magritte }
AppBskyActorDefsLabelersPref >> labelersDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyActorDefsLabelerPrefItem};
		label: 'Labelers';
		accessor: #atpLabelers;
		beRequired
]
