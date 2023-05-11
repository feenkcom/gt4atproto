Class {
	#name : #AppBskyEmbedExternalMain,
	#superclass : #Object,
	#instVars : [
		'atProtoExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedExternalMain class >> fromRequest: aRequest [
	^ self new atProtoExternal: (aRequest at: 'external' ifPresent: [:aValue | AppBskyEmbedExternalExternal fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalMain >> atProtoExternal [
	<referenceTo:'#external'>
	^ atProtoExternal
]

{ #category : #accessing }
AppBskyEmbedExternalMain >> atProtoExternal: anObject [
	<referenceTo:'#external'>
	atProtoExternal := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalMain >> externalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'External';
		accessor: #atProtoExternal;
		beRequired
]
