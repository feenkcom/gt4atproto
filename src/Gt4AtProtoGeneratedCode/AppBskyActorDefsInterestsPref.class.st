Class {
	#name : #AppBskyActorDefsInterestsPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpTags'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsInterestsPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsInterestsPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsInterestsPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#interestsPref'
]

{ #category : #accessing }
AppBskyActorDefsInterestsPref class >> atpSchema [
 ^ '{"type":"object","required":["tags"],"properties":{"tags":{"type":"array","maxLength":100,"items":{"type":"string","maxLength":640,"maxGraphemes":64},"description":"A list of tags which describe the account owner''s interests gathered during onboarding."}}}'
]

{ #category : #serialization }
AppBskyActorDefsInterestsPref class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpTags: (aRequest
				at: 'tags'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsInterestsPref >> atpTags [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpTags
]

{ #category : #accessing }
AppBskyActorDefsInterestsPref >> atpTags: anObject [
	atpTags := anObject
]

{ #category : #magritte }
AppBskyActorDefsInterestsPref >> tagsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Tags';
		accessor: #atpTags;
		beRequired
]
