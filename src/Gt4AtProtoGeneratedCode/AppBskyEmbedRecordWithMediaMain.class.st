Class {
	#name : #AppBskyEmbedRecordWithMediaMain,
	#superclass : #Object,
	#instVars : [
		'atpRecord',
		'atpMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordWithMediaMain class >> fromRequest: aRequest [
	^ self new atpRecord: (aRequest at: 'record' ifPresent: [:aValue | AppBskyEmbedRecordMain fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpMedia: (aRequest at: 'media' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpMedia [
	^ atpMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpMedia: anObject [
	atpMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpRecord [
	<referenceTo:'app.bsky.embed.record'>
	^ atpRecord
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpRecord: anObject [
	<referenceTo:'app.bsky.embed.record'>
	atpRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaMain >> mediaDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images'. 'app.bsky.embed.external'};
		label: 'Media';
		accessor: #atpMedia;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaMain >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]
