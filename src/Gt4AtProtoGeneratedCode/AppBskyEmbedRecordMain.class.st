Class {
	#name : #AppBskyEmbedRecordMain,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordMain class >> fromRequest: aRequest [
	^ self new atProtoRecord: (aRequest at: 'record' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordMain >> atProtoRecord [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyEmbedRecordMain >> atProtoRecord: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atProtoRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordMain >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atProtoRecord;
		beRequired
]
