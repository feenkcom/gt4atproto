Class {
	#name : #AppBskyEmbedRecordViewRecord,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoAuthor',
		'atProtoValue',
		'atProtoLabels',
		'atProtoEmbeds',
		'atProtoIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyEmbedRecordViewRecord class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoAuthor: (aRequest at: 'author' ifPresent: [:aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ]); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ]); 
		atProtoEmbeds: (aRequest at: 'embeds' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoAuthor [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atProtoAuthor
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atProtoAuthor := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoEmbeds [
	^ atProtoEmbeds
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoEmbeds: anObject [
	atProtoEmbeds := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atProtoAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> embedsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesView. AppBskyEmbedExternalView. AppBskyEmbedRecordView. AppBskyEmbedRecordWithMediaView};
		label: 'Embeds';
		accessor: #atProtoEmbeds
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
