Class {
	#name : #AppBskyEmbedExternalView,
	#superclass : #Object,
	#instVars : [
		'atProtoExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedExternalView class >> fromRequest: aRequest [
	^ self new atProtoExternal: (aRequest at: 'external' ifPresent: [:aValue | AppBskyEmbedExternalViewExternal fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedExternalView >> atProtoExternal [
	<referenceTo:'#viewExternal'>
	^ atProtoExternal
]

{ #category : #accessing }
AppBskyEmbedExternalView >> atProtoExternal: anObject [
	<referenceTo:'#viewExternal'>
	atProtoExternal := anObject
]

{ #category : #magritte }
AppBskyEmbedExternalView >> externalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'External';
		accessor: #atProtoExternal;
		beRequired
]
