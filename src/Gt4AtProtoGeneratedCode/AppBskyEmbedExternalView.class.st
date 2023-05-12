Class {
	#name : #AppBskyEmbedExternalView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedExternalView class >> atpRecordName [
 ^ 'app.bsky.embed.external#view'
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
