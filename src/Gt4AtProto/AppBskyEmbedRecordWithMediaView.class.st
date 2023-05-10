Class {
	#name : #AppBskyEmbedRecordWithMediaView,
	#superclass : #Object,
	#instVars : [
		'atProtoRecord',
		'atProtoMedia'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atProtoMedia [
	^ atProtoMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atProtoMedia: anObject [
	atProtoMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atProtoRecord [
	<referenceTo:'app.bsky.embed.record#view'>
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atProtoRecord: anObject [
	<referenceTo:'app.bsky.embed.record#view'>
	atProtoRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaView >> mediaDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images#view'. 'app.bsky.embed.external#view'};
		label: 'Media';
		accessor: #atProtoMedia;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordWithMediaView >> recordDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Record';
		accessor: #atProtoRecord;
		beRequired
]
