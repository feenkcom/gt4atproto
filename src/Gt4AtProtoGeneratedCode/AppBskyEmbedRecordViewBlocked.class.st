Class {
	#name : #AppBskyEmbedRecordViewBlocked,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewBlocked'
]

{ #category : #serialization }
AppBskyEmbedRecordViewBlocked class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
