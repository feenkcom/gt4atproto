Class {
	#name : #AppBskyEmbedRecordMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRecord'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRecord: (aRequest at: 'record' ifPresent: [:aValue | ComAtprotoRepoStrongRefMain fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordMain >> atpRecord [
	<referenceTo:'com.atproto.repo.strongRef'>
	^ atpRecord
]

{ #category : #accessing }
AppBskyEmbedRecordMain >> atpRecord: anObject [
	<referenceTo:'com.atproto.repo.strongRef'>
	atpRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordMain >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]
