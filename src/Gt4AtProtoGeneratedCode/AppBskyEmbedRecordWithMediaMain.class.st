Class {
	#name : #AppBskyEmbedRecordWithMediaMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRecord',
		'atpMedia'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain class >> atpFile [
 ^ 'app/bsky/embed/recordWithMedia.json'
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain class >> atpRecordName [
 ^ 'app.bsky.embed.recordWithMedia'
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain class >> atpSchema [
 ^ '{"type":"object","required":["record","media"],"properties":{"record":{"type":"ref","ref":"app.bsky.embed.record"},"media":{"type":"union","refs":["app.bsky.embed.images","app.bsky.embed.video","app.bsky.embed.external"]}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordWithMediaMain class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | AppBskyEmbedRecordMain fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpMedia: (aRequest
				at: 'media'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.images' -> AppBskyEmbedImagesMain.
						'app.bsky.embed.video' -> AppBskyEmbedVideoMain.
						'app.bsky.embed.external' -> AppBskyEmbedExternalMain} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpMedia [
	<atpType:#(AppBskyEmbedImagesMain AppBskyEmbedVideoMain AppBskyEmbedExternalMain) format:nil>
	^ atpMedia
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpMedia: anObject [
	atpMedia := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordWithMediaMain >> atpRecord [
	<referenceTo:'app.bsky.embed.record'>
	<atpType:#AppBskyEmbedRecordMain format:nil>
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
		options: {'app.bsky.embed.images'.
				'app.bsky.embed.video'.
				'app.bsky.embed.external'};
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
