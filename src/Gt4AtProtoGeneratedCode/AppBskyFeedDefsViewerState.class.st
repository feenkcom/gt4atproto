Class {
	#name : #AppBskyFeedDefsViewerState,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRepost',
		'atpLike',
		'atpThreadMuted',
		'atpReplyDisabled',
		'atpEmbeddingDisabled',
		'atpPinned'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsViewerState class >> atpDescription [
 ^  'Metadata about the requesting account''s relationship with the subject content. Only has meaningful content for authed requests.'
]

{ #category : #accessing }
AppBskyFeedDefsViewerState class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsViewerState class >> atpRecordName [
 ^ 'app.bsky.feed.defs#viewerState'
]

{ #category : #accessing }
AppBskyFeedDefsViewerState class >> atpSchema [
 ^ '{"type":"object","description":"Metadata about the requesting account''s relationship with the subject content. Only has meaningful content for authed requests.","properties":{"repost":{"type":"string","format":"at-uri"},"like":{"type":"string","format":"at-uri"},"threadMuted":{"type":"boolean"},"replyDisabled":{"type":"boolean"},"embeddingDisabled":{"type":"boolean"},"pinned":{"type":"boolean"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsViewerState class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRepost: (aRequest at: 'repost' ifAbsent: [ nil ]);
		atpLike: (aRequest at: 'like' ifAbsent: [ nil ]);
		atpThreadMuted: (aRequest at: 'threadMuted' ifAbsent: [ nil ]);
		atpReplyDisabled: (aRequest at: 'replyDisabled' ifAbsent: [ nil ]);
		atpEmbeddingDisabled: (aRequest at: 'embeddingDisabled' ifAbsent: [ nil ]);
		atpPinned: (aRequest at: 'pinned' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpEmbeddingDisabled [
	<atpType:#Boolean format:nil>
	^ atpEmbeddingDisabled
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpEmbeddingDisabled: anObject [
	atpEmbeddingDisabled := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpLike [
	<atpType:#String format:'at-uri'>
	^ atpLike
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpLike: anObject [
	atpLike := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpPinned [
	<atpType:#Boolean format:nil>
	^ atpPinned
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpPinned: anObject [
	atpPinned := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpReplyDisabled [
	<atpType:#Boolean format:nil>
	^ atpReplyDisabled
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpReplyDisabled: anObject [
	atpReplyDisabled := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpRepost [
	<atpType:#String format:'at-uri'>
	^ atpRepost
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpRepost: anObject [
	atpRepost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpThreadMuted [
	<atpType:#Boolean format:nil>
	^ atpThreadMuted
]

{ #category : #accessing }
AppBskyFeedDefsViewerState >> atpThreadMuted: anObject [
	atpThreadMuted := anObject
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> embeddingDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'EmbeddingDisabled';
		accessor: #atpEmbeddingDisabled
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> likeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Like';
		accessor: #atpLike
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> pinnedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Pinned';
		accessor: #atpPinned
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> replyDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'ReplyDisabled';
		accessor: #atpReplyDisabled
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> repostDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Repost';
		accessor: #atpRepost
]

{ #category : #magritte }
AppBskyFeedDefsViewerState >> threadMutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'ThreadMuted';
		accessor: #atpThreadMuted
]
