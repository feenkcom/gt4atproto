Class {
	#name : #AppBskyActorDefsSavedFeedsPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPinned',
		'atpSaved',
		'atpTimelineIndex'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#savedFeedsPref'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref class >> atpSchema [
 ^ '{"type":"object","required":["pinned","saved"],"properties":{"pinned":{"type":"array","items":{"type":"string","format":"at-uri"}},"saved":{"type":"array","items":{"type":"string","format":"at-uri"}},"timelineIndex":{"type":"integer"}}}'
]

{ #category : #serialization }
AppBskyActorDefsSavedFeedsPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPinned: (aRequest
				at: 'pinned'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpSaved: (aRequest
				at: 'saved'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpTimelineIndex: (aRequest at: 'timelineIndex' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpPinned [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpPinned
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpPinned: anObject [
	atpPinned := anObject
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpSaved [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpSaved
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpSaved: anObject [
	atpSaved := anObject
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpTimelineIndex [
	<atpType:#Number format:nil>
	^ atpTimelineIndex
]

{ #category : #accessing }
AppBskyActorDefsSavedFeedsPref >> atpTimelineIndex: anObject [
	atpTimelineIndex := anObject
]

{ #category : #magritte }
AppBskyActorDefsSavedFeedsPref >> pinnedDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Pinned';
		accessor: #atpPinned;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsSavedFeedsPref >> savedDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Saved';
		accessor: #atpSaved;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsSavedFeedsPref >> timelineIndexDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'TimelineIndex';
		accessor: #atpTimelineIndex
]
