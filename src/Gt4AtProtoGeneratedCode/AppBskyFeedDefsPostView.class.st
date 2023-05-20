Class {
	#name : #AppBskyFeedDefsPostView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpAuthor',
		'atpRecord',
		'atpEmbed',
		'atpReplyCount',
		'atpRepostCount',
		'atpLikeCount',
		'atpIndexedAt',
		'atpViewer',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsPostView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsPostView class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsPostView class >> atpRecordName [
 ^ 'app.bsky.feed.defs#postView'
]

{ #category : #accessing }
AppBskyFeedDefsPostView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","author","record","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"author":{"type":"ref","ref":"app.bsky.actor.defs#profileViewBasic"},"record":{"type":"unknown"},"embed":{"type":"union","refs":["app.bsky.embed.images#view","app.bsky.embed.external#view","app.bsky.embed.record#view","app.bsky.embed.recordWithMedia#view"]},"replyCount":{"type":"integer"},"repostCount":{"type":"integer"},"likeCount":{"type":"integer"},"indexedAt":{"type":"string","format":"datetime"},"viewer":{"type":"ref","ref":"#viewerState"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyFeedDefsPostView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpAuthor: (aRequest
				at: 'author'
				ifPresent: [ :aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue ]
				ifAbsent: [ nil ]);
		atpEmbed: (aRequest
				at: 'embed'
				ifPresent: [ :aValue | 
					({'app.bsky.embed.images#view' -> AppBskyEmbedImagesView.
						'app.bsky.embed.external#view' -> AppBskyEmbedExternalView.
						'app.bsky.embed.record#view' -> AppBskyEmbedRecordView.
						'app.bsky.embed.recordWithMedia#view' -> AppBskyEmbedRecordWithMediaView}
						asDictionary at: (aValue at: '$type')) fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReplyCount: (aRequest at: 'replyCount' ifAbsent: [ nil ]);
		atpRepostCount: (aRequest at: 'repostCount' ifAbsent: [ nil ]);
		atpLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyFeedDefsViewerState fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpAuthor [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	<atpType:#AppBskyActorDefsProfileViewBasic format:nil>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpEmbed [
	<atpType:#(AppBskyEmbedImagesView AppBskyEmbedExternalView AppBskyEmbedRecordView AppBskyEmbedRecordWithMediaView) format:nil>
	^ atpEmbed
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLikeCount [
	<atpType:#Number format:nil>
	^ atpLikeCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLikeCount: anObject [
	atpLikeCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRecord [
	<atpType:#Object format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpReplyCount [
	<atpType:#Number format:nil>
	^ atpReplyCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpReplyCount: anObject [
	atpReplyCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRepostCount [
	<atpType:#Number format:nil>
	^ atpRepostCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRepostCount: anObject [
	atpRepostCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpViewer [
	<referenceTo:'#viewerState'>
	<atpType:#AppBskyFeedDefsViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpViewer: anObject [
	<referenceTo:'#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atpAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images#view'.
				'app.bsky.embed.external#view'.
				'app.bsky.embed.record#view'.
				'app.bsky.embed.recordWithMedia#view'};
		label: 'Embed';
		accessor: #atpEmbed
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> likeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'LikeCount';
		accessor: #atpLikeCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> replyCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ReplyCount';
		accessor: #atpReplyCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> repostCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'RepostCount';
		accessor: #atpRepostCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
