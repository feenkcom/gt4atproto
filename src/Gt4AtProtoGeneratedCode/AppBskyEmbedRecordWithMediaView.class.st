Class {
	#name : #AppBskyEmbedRecordWithMediaView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRecord',
		'atpMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView class >> atpRecordName [
 ^ 'app.bsky.embed.recordWithMedia#view'
]

{ #category : #serialization }
AppBskyEmbedRecordWithMediaView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRecord: (aRequest at: 'record' ifPresent: [:aValue | AppBskyEmbedRecordView fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpMedia: (aRequest at: 'media' ifPresent: [:aValue | ({'app.bsky.embed.images#view' -> AppBskyEmbedImagesView. 'app.bsky.embed.external#view' -> AppBskyEmbedExternalView} asDictionary at: (aValue at: '$type')) fromRequest: aValue] ifAbsent: [ nil ])
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
