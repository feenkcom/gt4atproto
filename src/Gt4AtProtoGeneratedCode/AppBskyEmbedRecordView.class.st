Class {
	#name : #AppBskyEmbedRecordView,
	#superclass : #Object,
	#instVars : [
		'atpRecord'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordView class >> fromRequest: aRequest [
	^ self new atpRecord: (aRequest at: 'record' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atpRecord [
	^ atpRecord
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordView >> recordDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#viewRecord'. '#viewNotFound'. '#viewBlocked'};
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]
