Class {
	#name : #AppBskyEmbedRecordView,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyEmbedRecordView',
	#classTraits : 'TAppBskyEmbedRecordView classTrait',
	#instVars : [
		'atpRecord'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedRecordView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyEmbedRecordView class >> atpFile [
 ^ 'app/bsky/embed/record.json'
]

{ #category : #accessing }
AppBskyEmbedRecordView class >> atpRecordName [
 ^ 'app.bsky.embed.record#view'
]

{ #category : #accessing }
AppBskyEmbedRecordView class >> atpSchema [
 ^ '{"type":"object","required":["record"],"properties":{"record":{"type":"union","refs":["#viewRecord","#viewNotFound","#viewBlocked","app.bsky.feed.defs#generatorView","app.bsky.graph.defs#listView"]}}}'
]

{ #category : #serialization }
AppBskyEmbedRecordView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.record#viewRecord' -> AppBskyEmbedRecordViewRecord.
						'app.bsky.embed.record#viewNotFound' -> AppBskyEmbedRecordViewNotFound.
						'app.bsky.embed.record#viewBlocked' -> AppBskyEmbedRecordViewBlocked.
						'app.bsky.feed.defs#generatorView' -> AppBskyFeedDefsGeneratorView.
						'app.bsky.graph.defs#listView' -> AppBskyGraphDefsListView} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atpRecord [
	<atpType:#(AppBskyEmbedRecordViewRecord AppBskyEmbedRecordViewNotFound AppBskyEmbedRecordViewBlocked AppBskyFeedDefsGeneratorView AppBskyGraphDefsListView) format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyEmbedRecordView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #magritte }
AppBskyEmbedRecordView >> recordDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#viewRecord'.
				'#viewNotFound'.
				'#viewBlocked'.
				'app.bsky.feed.defs#generatorView'.
				'app.bsky.graph.defs#listView'};
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]
