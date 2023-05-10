Class {
	#name : #AppBskyEmbedRecordView,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
