Class {
	#name : #AppBskyEmbedRecordView,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordView class >> fromRequest: aRequest [
	^ self new atProtoRecord: (aRequest at: 'record' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atProtoRecord [
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atProtoRecord: anObject [
	atProtoRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordView >> recordDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#viewRecord'. '#viewNotFound'. '#viewBlocked'};
		label: 'Record';
		accessor: #atProtoRecord;
		beRequired
]
