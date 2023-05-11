Class {
	#name : #AppBskyEmbedExternalMain,
	#superclass : #Object,
	#instVars : [
		'atpExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedExternalMain class >> fromRequest: aRequest [
	^ self new atpExternal: (aRequest at: 'external' ifPresent: [:aValue | AppBskyEmbedExternalExternal fromRequest: aValue ] ifAbsent: [ nil ])
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
