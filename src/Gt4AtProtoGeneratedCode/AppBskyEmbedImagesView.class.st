Class {
	#name : #AppBskyEmbedImagesView,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedImagesView',
	#classTraits : 'TAppBskyEmbedImagesView classTrait',
	#instVars : [
		'atpImages'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedImagesView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedImagesView class >> atpFile [
 ^ 'app/bsky/embed/images.json'
]

{ #category : #accessing }
AppBskyEmbedImagesView class >> atpRecordName [
 ^ 'app.bsky.embed.images#view'
]

{ #category : #accessing }
AppBskyEmbedImagesView class >> atpSchema [
 ^ '{"type":"object","required":["images"],"properties":{"images":{"type":"array","items":{"type":"ref","ref":"#viewImage"},"maxLength":4}}}'
]

{ #category : #serialization }
AppBskyEmbedImagesView class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpImages: (aRequest
				at: 'images'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyEmbedImagesViewImage fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atpImages [
	<atpType:#AppBskyEmbedImagesViewImage format:nil>
	<atpCollection>
	^ atpImages
]

{ #category : #accessing }
AppBskyEmbedImagesView >> atpImages: anObject [
	atpImages := anObject
]

{ #category : #magritte }
AppBskyEmbedImagesView >> imagesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesViewImage};
		label: 'Images';
		accessor: #atpImages;
		beRequired
]
