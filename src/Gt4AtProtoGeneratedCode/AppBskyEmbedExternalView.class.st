Class {
	#name : #AppBskyEmbedExternalView,
	#superclass : #Object,
	#instVars : [
		'atProtoExternal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

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
