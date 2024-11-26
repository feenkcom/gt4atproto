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
 ^  'A representation of some externally linked content (eg, a URL and ''card''), embedded in a Bluesky record (eg, a post).'
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
 ^ '{"type":"object","description":"A representation of some externally linked content (eg, a URL and ''card''), embedded in a Bluesky record (eg, a post).","required":["external"],"properties":{"external":{"type":"ref","ref":"#external"}}}'
]

{ #category : #serialization }
AppBskyEmbedExternalMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpExternal: (aRequest
				at: 'external'
				ifPresent: [ :aValue | AppBskyEmbedExternalExternal fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalMain >> atpExternal [
	<referenceTo:'#external'>
	<atpType:#AppBskyEmbedExternalExternal format:nil>
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
