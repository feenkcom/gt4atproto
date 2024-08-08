Class {
	#name : #AppBskyActorDefsKnownFollowers,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCount',
		'atpFollowers'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsKnownFollowers class >> atpDescription [
 ^  'The subject''s followers whom you also follow'
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers class >> atpRecordName [
 ^ 'app.bsky.actor.defs#knownFollowers'
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers class >> atpSchema [
 ^ '{"type":"object","description":"The subject''s followers whom you also follow","required":["count","followers"],"properties":{"count":{"type":"integer"},"followers":{"type":"array","minLength":0,"maxLength":5,"items":{"type":"ref","ref":"#profileViewBasic"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsKnownFollowers class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCount: (aRequest at: 'count' ifAbsent: [ nil ]);
		atpFollowers: (aRequest
				at: 'followers'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers >> atpCount [
	<atpType:#Number format:nil>
	^ atpCount
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers >> atpCount: anObject [
	atpCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers >> atpFollowers [
	<atpType:#AppBskyActorDefsProfileViewBasic format:nil>
	<atpCollection>
	^ atpFollowers
]

{ #category : #accessing }
AppBskyActorDefsKnownFollowers >> atpFollowers: anObject [
	atpFollowers := anObject
]

{ #category : #magritte }
AppBskyActorDefsKnownFollowers >> countDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Count';
		accessor: #atpCount;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsKnownFollowers >> followersDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyActorDefsProfileViewBasic};
		label: 'Followers';
		accessor: #atpFollowers;
		beRequired
]
