Class {
	#name : #AppBskyEmbedRecordWithMediaView,
	#superclass : #Object,
	#instVars : [
		'atpRecord',
		'atpMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordWithMediaView class >> fromRequest: aRequest [
	^ self new atpRecord: (aRequest at: 'record' ifPresent: [:aValue | AppBskyEmbedRecordView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpMedia: (aRequest at: 'media' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpMedia [
	^ atpMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpMedia: anObject [
	atpMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpRecord [
	<referenceTo:'app.bsky.embed.record#view'>
	^ atpRecord
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpRecord: anObject [
	<referenceTo:'app.bsky.embed.record#view'>
	atpRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaView >> mediaDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images#view'. 'app.bsky.embed.external#view'};
		label: 'Media';
		accessor: #atpMedia;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaView >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]
