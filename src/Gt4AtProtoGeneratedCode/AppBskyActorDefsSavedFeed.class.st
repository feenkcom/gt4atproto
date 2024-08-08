Class {
	#name : #AppBskyActorDefsSavedFeed,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpType',
		'atpValue',
		'atpPinned'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsSavedFeed class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed class >> atpRecordName [
 ^ 'app.bsky.actor.defs#savedFeed'
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed class >> atpSchema [
 ^ '{"type":"object","required":["id","type","value","pinned"],"properties":{"id":{"type":"string"},"type":{"type":"string","knownValues":["feed","list","timeline"]},"value":{"type":"string"},"pinned":{"type":"boolean"}}}'
]

{ #category : #serialization }
AppBskyActorDefsSavedFeed class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpType: (aRequest at: 'type' ifAbsent: [ nil ]);
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ]);
		atpPinned: (aRequest at: 'pinned' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpPinned [
	<atpType:#Boolean format:nil>
	^ atpPinned
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpPinned: anObject [
	atpPinned := anObject
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpType [
	<atpType:#String format:nil>
	^ atpType
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpType: anObject [
	atpType := anObject
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpValue [
	<atpType:#String format:nil>
	^ atpValue
]

{ #category : #accessing }
AppBskyActorDefsSavedFeed >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
AppBskyActorDefsSavedFeed >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsSavedFeed >> pinnedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Pinned';
		accessor: #atpPinned;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsSavedFeed >> typeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Type';
		accessor: #atpType;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsSavedFeed >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
