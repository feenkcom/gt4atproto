Class {
	#name : #AppBskyEmbedRecordViewBlocked,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpBlocked',
		'atpAuthor'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked class >> atpFile [
 ^ 'app/bsky/embed/record.json'
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewBlocked'
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordViewBlocked class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpAuthor [
	<referenceTo:'app.bsky.feed.defs#blockedAuthor'>
	<atpType:#AppBskyFeedDefsBlockedAuthor format:nil>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpAuthor: anObject [
	<referenceTo:'app.bsky.feed.defs#blockedAuthor'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpBlocked [
	<atpType:#Boolean format:nil>
	^ atpBlocked
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpBlocked: anObject [
	atpBlocked := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewBlocked >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atpAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> blockedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Blocked';
		accessor: #atpBlocked;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewBlocked >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
