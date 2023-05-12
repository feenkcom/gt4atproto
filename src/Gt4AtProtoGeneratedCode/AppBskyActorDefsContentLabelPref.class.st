Class {
	#name : #AppBskyActorDefsContentLabelPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLabel',
		'atpVisibility'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#contentLabelPref'
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpSchema [
 ^ '{"type":"object","required":["label","visibility"],"properties":{"label":{"type":"string"},"visibility":{"type":"string","knownValues":["show","warn","hide"]}}}'
]

{ #category : #serialization }
AppBskyActorDefsContentLabelPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpLabel: (aRequest at: 'label' ifAbsent: [ nil ]); 
		atpVisibility: (aRequest at: 'visibility' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabel [
	^ atpLabel
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabel: anObject [
	atpLabel := anObject
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpVisibility [
	^ atpVisibility
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpVisibility: anObject [
	atpVisibility := anObject
]

{ #category : #magritte }
AppBskyActorDefsContentLabelPref >> labelDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Label';
		accessor: #atpLabel;
	beRequired
]

{ #category : #magritte }
AppBskyActorDefsContentLabelPref >> visibilityDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Visibility';
		accessor: #atpVisibility;
	beRequired
]
