Class {
	#name : #AppBskyEmbedRecordWithMediaView,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedRecordWithMediaView',
	#classTraits : 'TAppBskyEmbedRecordWithMediaView classTrait',
	#instVars : [
		'atpRecord',
		'atpMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView class >> atpFile [
 ^ 'app/bsky/embed/recordWithMedia.json'
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView class >> atpRecordName [
 ^ 'app.bsky.embed.recordWithMedia#view'
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView class >> atpSchema [
 ^ '{"type":"object","required":["record","media"],"properties":{"record":{"type":"ref","ref":"app.bsky.embed.record#view"},"media":{"type":"union","refs":["app.bsky.embed.images#view","app.bsky.embed.external#view"]}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordWithMediaView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | AppBskyEmbedRecordView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpMedia: (aRequest
				at: 'media'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.images#view' -> AppBskyEmbedImagesView.
						'app.bsky.embed.external#view' -> AppBskyEmbedExternalView} asDictionary
						at: (aValue at: '$type')) fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpMedia [
	<atpType:#(AppBskyEmbedImagesView AppBskyEmbedExternalView) format:nil>
	^ atpMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpMedia: anObject [
	atpMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaView >> atpRecord [
	<referenceTo:'app.bsky.embed.record#view'>
	<atpType:#AppBskyEmbedRecordView format:nil>
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
		options: {'app.bsky.embed.images#view'.
				'app.bsky.embed.external#view'};
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
