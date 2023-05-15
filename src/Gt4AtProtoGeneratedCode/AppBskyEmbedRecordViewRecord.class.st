Class {
	#name : #AppBskyEmbedRecordViewRecord,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpAuthor',
		'atpValue',
		'atpLabels',
		'atpEmbeds',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordViewRecord class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord class >> atpFile [
 ^ 'app/bsky/embed/record.json'
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord class >> atpRecordName [
 ^ 'app.bsky.embed.record#viewRecord'
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","author","value","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"author":{"type":"ref","ref":"app.bsky.actor.defs#profileViewBasic"},"value":{"type":"unknown"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"embeds":{"type":"array","items":{"type":"union","refs":["app.bsky.embed.images#view","app.bsky.embed.external#view","app.bsky.embed.record#view","app.bsky.embed.recordWithMedia#view"]}},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordViewRecord class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpAuthor: (aRequest at: 'author' ifPresent: [:aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifPresent: [:aValue | GtApModelEntity findForRequest: aValue ] ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoLabelDefsLabel fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpEmbeds: (aRequest at: 'embeds' ifPresent: [:anArray | anArray collect: [:aValue |({'app.bsky.embed.images#view' -> AppBskyEmbedImagesView. 'app.bsky.embed.external#view' -> AppBskyEmbedExternalView. 'app.bsky.embed.record#view' -> AppBskyEmbedRecordView. 'app.bsky.embed.recordWithMedia#view' -> AppBskyEmbedRecordWithMediaView} asDictionary at: (aValue at: '$type')) fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpAuthor [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpCid [
	^ atpCid
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpEmbeds [
	^ atpEmbeds
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpEmbeds: anObject [
	atpEmbeds := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpValue [
	^ atpValue
]

{ #category : #accessing }
AppBskyEmbedRecordViewRecord >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atpAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> embedsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyEmbedImagesView. AppBskyEmbedExternalView. AppBskyEmbedRecordView. AppBskyEmbedRecordWithMediaView};
		label: 'Embeds';
		accessor: #atpEmbeds
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]

{ #category : #magritte }
AppBskyEmbedRecordViewRecord >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
	beRequired
]
