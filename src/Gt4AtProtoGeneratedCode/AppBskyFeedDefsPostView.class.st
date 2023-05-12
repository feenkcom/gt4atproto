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

{ #category : #serialization }
AppBskyFeedDefsPostView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpAuthor: (aRequest at: 'author' ifPresent: [:aValue | AppBskyActorDefsProfileViewBasic fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpRecord: (aRequest at: 'record' ifAbsent: [ nil ]); 
		atpEmbed: (aRequest at: 'embed' ifAbsent: [ nil ]); 
		atpReplyCount: (aRequest at: 'replyCount' ifAbsent: [ nil ]); 
		atpRepostCount: (aRequest at: 'repostCount' ifAbsent: [ nil ]); 
		atpLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]); 
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]); 
		atpViewer: (aRequest at: 'viewer' ifPresent: [:aValue | AppBskyFeedDefsViewerState fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpAuthor [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileViewBasic'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpCid [
	^ atpCid
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpEmbed [
	^ atpEmbed
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpEmbed: anObject [
	atpEmbed := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpIndexedAt [
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLikeCount [
	^ atpLikeCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpLikeCount: anObject [
	atpLikeCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRecord [
	^ atpRecord
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpReplyCount [
	^ atpReplyCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpReplyCount: anObject [
	atpReplyCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRepostCount [
	^ atpRepostCount
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpRepostCount: anObject [
	atpRepostCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyFeedDefsPostView >> atpViewer [
	<referenceTo:'#viewerState'>
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
		options: {'app.bsky.embed.images#view'. 'app.bsky.embed.external#view'. 'app.bsky.embed.record#view'. 'app.bsky.embed.recordWithMedia#view'};
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
