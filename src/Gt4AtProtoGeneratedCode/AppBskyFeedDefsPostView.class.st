Class {
	#name : #AppBskyFeedDefsPostView,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoAuthor',
		'atProtoRecord',
		'atProtoEmbed',
		'atProtoReplyCount',
		'atProtoRepostCount',
		'atProtoLikeCount',
		'atProtoIndexedAt',
		'atProtoViewer',
		'atProtoLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsPostView class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atProtoAuthor: (aRequest at: 'author' ifPresent: [:aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoRecord: (aRequest at: 'record' ifAbsent: [ nil ]); 
		atProtoEmbed: (aRequest at: 'embed' ifAbsent: [ nil ]); 
		atProtoReplyCount: (aRequest at: 'replyCount' ifAbsent: [ nil ]); 
		atProtoRepostCount: (aRequest at: 'repostCount' ifAbsent: [ nil ]); 
		atProtoLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]); 
		atProtoIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atProtoViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyFeedDefsViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoAuthor [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atProtoAuthor
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atProtoAuthor := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoEmbed [
	^ atProtoEmbed
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoEmbed: anObject [
	atProtoEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoLikeCount [
	^ atProtoLikeCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoLikeCount: anObject [
	atProtoLikeCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoRecord [
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoRecord: anObject [
	atProtoRecord := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoReplyCount [
	^ atProtoReplyCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoReplyCount: anObject [
	atProtoReplyCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoRepostCount [
	^ atProtoRepostCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoRepostCount: anObject [
	atProtoRepostCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoViewer [
	<referenceTo:'#viewerState'>
	^ atProtoViewer
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atProtoViewer: anObject [
	<referenceTo:'#viewerState'>
	atProtoViewer := anObject
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atProtoAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> embedDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'app.bsky.embed.images#view'. 'app.bsky.embed.external#view'. 'app.bsky.embed.record#view'. 'app.bsky.embed.recordWithMedia#view'};
		label: 'Embed';
		accessor: #atProtoEmbed
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> likeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'LikeCount';
		accessor: #atProtoLikeCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atProtoRecord;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> replyCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ReplyCount';
		accessor: #atProtoReplyCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> repostCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'RepostCount';
		accessor: #atProtoRepostCount
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsPostView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atProtoViewer
]
