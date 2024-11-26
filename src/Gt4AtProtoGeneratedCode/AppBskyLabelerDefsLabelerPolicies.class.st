Class {
	#name : #AppBskyLabelerDefsLabelerPolicies,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLabelValues',
		'atpLabelValueDefinitions'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies class >> atpFile [
 ^ 'app/bsky/labeler/defs.json'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies class >> atpRecordName [
 ^ 'app.bsky.labeler.defs#labelerPolicies'
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies class >> atpSchema [
 ^ '{"type":"object","required":["labelValues"],"properties":{"labelValues":{"type":"array","description":"The label values which this labeler publishes. May include global or custom labels.","items":{"type":"ref","ref":"com.atproto.label.defs#labelValue"}},"labelValueDefinitions":{"type":"array","description":"Label values created by this labeler and scoped exclusively to it. Labels defined here will override global label definitions for this labeler.","items":{"type":"ref","ref":"com.atproto.label.defs#labelValueDefinition"}}}}'
]

{ #category : #serialization }
AppBskyLabelerDefsLabelerPolicies class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpLabelValues: (aRequest
				at: 'labelValues'
				ifPresent: [ :anArray | anArray collect: [ :aValue | String fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpLabelValueDefinitions: (aRequest
				at: 'labelValueDefinitions'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoLabelDefsLabelValueDefinition fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies >> atpLabelValueDefinitions [
	<atpType:#ComAtprotoLabelDefsLabelValueDefinition format:nil>
	<atpCollection>
	^ atpLabelValueDefinitions
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies >> atpLabelValueDefinitions: anObject [
	atpLabelValueDefinitions := anObject
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies >> atpLabelValues [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpLabelValues
]

{ #category : #accessing }
AppBskyLabelerDefsLabelerPolicies >> atpLabelValues: anObject [
	atpLabelValues := anObject
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerPolicies >> labelValueDefinitionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabelValueDefinition};
		label: 'LabelValueDefinitions';
		accessor: #atpLabelValueDefinitions
]

{ #category : #magritte }
AppBskyLabelerDefsLabelerPolicies >> labelValuesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'LabelValues';
		accessor: #atpLabelValues;
		beRequired
]
