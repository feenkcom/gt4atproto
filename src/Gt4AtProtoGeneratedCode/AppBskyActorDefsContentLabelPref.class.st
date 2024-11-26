Class {
	#name : #AppBskyActorDefsContentLabelPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLabelerDid',
		'atpLabel',
		'atpVisibility'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#contentLabelPref'
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref class >> atpSchema [
 ^ '{"type":"object","required":["label","visibility"],"properties":{"labelerDid":{"type":"string","description":"Which labeler does this preference apply to? If undefined, applies globally.","format":"did"},"label":{"type":"string"},"visibility":{"type":"string","knownValues":["ignore","show","warn","hide"]}}}'
]

{ #category : #serialization }
AppBskyActorDefsContentLabelPref class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpLabelerDid: (aRequest at: 'labelerDid' ifAbsent: [ nil ]);
		atpLabel: (aRequest at: 'label' ifAbsent: [ nil ]);
		atpVisibility: (aRequest at: 'visibility' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabel [
	<atpType:#String format:nil>
	^ atpLabel
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabel: anObject [
	atpLabel := anObject
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabelerDid [
	<atpType:#String format:'did'>
	^ atpLabelerDid
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpLabelerDid: anObject [
	atpLabelerDid := anObject
]

{ #category : #accessing }
AppBskyActorDefsContentLabelPref >> atpVisibility [
	<atpType:#String format:nil>
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
AppBskyActorDefsContentLabelPref >> labelerDidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LabelerDid';
		accessor: #atpLabelerDid
]

{ #category : #magritte }
AppBskyActorDefsContentLabelPref >> visibilityDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Visibility';
		accessor: #atpVisibility;
		beRequired
]
