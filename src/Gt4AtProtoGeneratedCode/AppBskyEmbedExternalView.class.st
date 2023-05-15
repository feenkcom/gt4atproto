Class {
	#name : #AppBskyEmbedExternalView,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedExternalView',
	#classTraits : 'TAppBskyEmbedExternalView classTrait',
	#instVars : [
		'atpExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedExternalView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedExternalView class >> atpFile [
 ^ 'app/bsky/embed/external.json'
]

{ #category : #accessing }
AppBskyEmbedExternalView class >> atpRecordName [
 ^ 'app.bsky.embed.external#view'
]

{ #category : #accessing }
AppBskyEmbedExternalView class >> atpSchema [
 ^ '{"type":"object","required":["external"],"properties":{"external":{"type":"ref","ref":"#viewExternal"}}}'
]

{ #category : #serialization }
AppBskyEmbedExternalView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpExternal: (aRequest at: 'external' ifPresent: [:aValue | AppBskyEmbedExternalViewExternal fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalView >> atpExternal [
	<referenceTo:'#viewExternal'>
	^ atpExternal
]

{ #category : #accessing }
AppBskyEmbedExternalView >> atpExternal: anObject [
	<referenceTo:'#viewExternal'>
	atpExternal := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalView >> externalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'External';
		accessor: #atpExternal;
		beRequired
]
