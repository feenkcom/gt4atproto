Class {
	#name : #AppBskyEmbedRecordViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewNotFound'
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordViewNotFound class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewNotFound >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewNotFound >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
