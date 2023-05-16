Class {
	#name : #AppBskyEmbedExternalMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedExternalMain class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedExternalMain class >> atpFile [
 ^ 'app/bsky/embed/external.json'
]

{ #category : #accessing }
AppBskyEmbedExternalMain class >> atpRecordName [
 ^ 'app.bsky.embed.external'
]

{ #category : #accessing }
AppBskyEmbedExternalMain class >> atpSchema [
 ^ '{"type":"object","required":["external"],"properties":{"external":{"type":"ref","ref":"#external"}}}'
]

{ #category : #serialization }
AppBskyEmbedExternalMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpExternal: (aRequest
				at: 'external'
				ifPresent: [ :aValue | AppBskyEmbedExternalExternal fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalMain >> atpExternal [
	<referenceTo:'#external'>
	^ atpExternal
]

{ #category : #accessing }
AppBskyEmbedExternalMain >> atpExternal: anObject [
	<referenceTo:'#external'>
	atpExternal := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalMain >> externalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'External';
		accessor: #atpExternal;
		beRequired
]
