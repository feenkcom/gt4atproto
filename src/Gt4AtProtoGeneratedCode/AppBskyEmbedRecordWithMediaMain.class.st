Class {
	#name : #AppBskyEmbedRecordWithMediaMain,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord',
		'atProtoMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordWithMediaMain class >> fromRequest: aRequest [
	^ self new atProtoRecord: (aRequest at: 'record' ifPresent: [:aValue | AppBskyEmbedRecordMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoMedia: (aRequest at: 'media' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atProtoMedia [
	^ atProtoMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atProtoMedia: anObject [
	atProtoMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atProtoRecord [
	<referenceTo:'app.bsky.embed.record'>
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atProtoRecord: anObject [
	<referenceTo:'app.bsky.embed.record'>
	atProtoRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaMain >> mediaDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images'. 'app.bsky.embed.external'};
		label: 'Media';
		accessor: #atProtoMedia;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaMain >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atProtoRecord;
		beRequired
]
