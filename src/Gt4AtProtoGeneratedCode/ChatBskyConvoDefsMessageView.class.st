Class {
	#name : #ChatBskyConvoDefsMessageView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpRev',
		'atpText',
		'atpFacets',
		'atpEmbed',
		'atpSender',
		'atpSentAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsMessageView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#messageView'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView class >> atpSchema [
 ^ '{"type":"object","required":["id","rev","text","sender","sentAt"],"properties":{"id":{"type":"string"},"rev":{"type":"string"},"text":{"type":"string","maxLength":10000,"maxGraphemes":1000},"facets":{"type":"array","description":"Annotations of text (mentions, URLs, hashtags, etc)","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"embed":{"type":"union","refs":["app.bsky.embed.record#view"]},"sender":{"type":"ref","ref":"#messageViewSender"},"sentAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsMessageView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpText: (aRequest at: 'text' ifAbsent: [ nil ]);
		atpFacets: (aRequest
				at: 'facets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpEmbed: (aRequest
				at: 'embed'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.record#view' -> AppBskyEmbedRecordView} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpSender: (aRequest
				at: 'sender'
				ifPresent: [ :aValue | ChatBskyConvoDefsMessageViewSender fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpSentAt: (aRequest at: 'sentAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpEmbed [
	<atpType:#(AppBskyEmbedRecordView) format:nil>
	^ atpEmbed
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpFacets
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpFacets: anObject [
	atpFacets := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpSender [
	<referenceTo:'#messageViewSender'>
	<atpType:#ChatBskyConvoDefsMessageViewSender format:nil>
	^ atpSender
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpSender: anObject [
	<referenceTo:'#messageViewSender'>
	atpSender := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpSentAt [
	<atpType:#String format:'datetime'>
	^ atpSentAt
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpSentAt: anObject [
	atpSentAt := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpText [
	<atpType:#String format:nil>
	^ atpText
]

{ #category : #accessing }
ChatBskyConvoDefsMessageView >> atpText: anObject [
	atpText := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.record#view'};
		label: 'Embed';
		accessor: #atpEmbed
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> facetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'Facets';
		accessor: #atpFacets
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> senderDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Sender';
		accessor: #atpSender;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> sentAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SentAt';
		accessor: #atpSentAt;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageView >> textDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Text';
		accessor: #atpText;
		beRequired
]
