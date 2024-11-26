Class {
	#name : #AppBskyLabelerServiceMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPolicies',
		'atpLabels',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyLabelerServiceMain class >> atpDescription [
 ^  'A declaration of the existence of labeler service.'
]

{ #category : #accessing }
AppBskyLabelerServiceMain class >> atpFile [
 ^ 'app/bsky/labeler/service.json'
]

{ #category : #accessing }
AppBskyLabelerServiceMain class >> atpRecordName [
 ^ 'app.bsky.labeler.service'
]

{ #category : #accessing }
AppBskyLabelerServiceMain class >> atpSchema [
 ^ '{"type":"record","description":"A declaration of the existence of labeler service.","key":"literal:self","record":{"type":"object","required":["policies","createdAt"],"properties":{"policies":{"type":"ref","ref":"app.bsky.labeler.defs#labelerPolicies"},"labels":{"type":"union","refs":["com.atproto.label.defs#selfLabels"]},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyLabelerServiceMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpPolicies: (aRequest
				at: 'policies'
				ifPresent: [ :aValue | AppBskyLabelerDefsLabelerPolicies fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :aValue | 
					({'com.atproto.label.defs#selfLabels' -> ComAtprotoLabelDefsSelfLabels}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpLabels [
	<atpType:#(ComAtprotoLabelDefsSelfLabels) format:nil>
	^ atpLabels
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpPolicies [
	<referenceTo:'app.bsky.labeler.defs#labelerPolicies'>
	<atpType:#AppBskyLabelerDefsLabelerPolicies format:nil>
	^ atpPolicies
]

{ #category : #accessing }
AppBskyLabelerServiceMain >> atpPolicies: anObject [
	<referenceTo:'app.bsky.labeler.defs#labelerPolicies'>
	atpPolicies := anObject
]

{ #category : #magritte }
AppBskyLabelerServiceMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyLabelerServiceMain >> labelsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.label.defs#selfLabels'};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyLabelerServiceMain >> policiesDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Policies';
		accessor: #atpPolicies;
		beRequired
]
