Class {
	#name : #AppBskyEmbedRecordMain,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
