Class {
	#name : #AppBskyFeedDefsReplyRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRoot',
		'atpParent'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpRecordName [
 ^ 'app.bsky.feed.defs#replyRef'
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef class >> atpSchema [
 ^ '{"type":"object","required":["root","parent"],"properties":{"root":{"type":"union","refs":["#postView","#notFoundPost","#blockedPost"]},"parent":{"type":"union","refs":["#postView","#notFoundPost","#blockedPost"]}}}'
]

{ #category : #serialization }
AppBskyFeedDefsReplyRef class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRoot: (aRequest
				at: 'root'
				ifPresent: [ :aValue | 
					({'app.bsky.feed.defs#postView' -> AppBskyFeedDefsPostView.
						'app.bsky.feed.defs#notFoundPost' -> AppBskyFeedDefsNotFoundPost.
						'app.bsky.feed.defs#blockedPost' -> AppBskyFeedDefsBlockedPost}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpParent: (aRequest
				at: 'parent'
				ifPresent: [ :aValue | 
					({'app.bsky.feed.defs#postView' -> AppBskyFeedDefsPostView.
						'app.bsky.feed.defs#notFoundPost' -> AppBskyFeedDefsNotFoundPost.
						'app.bsky.feed.defs#blockedPost' -> AppBskyFeedDefsBlockedPost}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpParent [
	<atpType:#(AppBskyFeedDefsPostView AppBskyFeedDefsNotFoundPost AppBskyFeedDefsBlockedPost) format:nil>
	^ atpParent
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpParent: anObject [
	atpParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpRoot [
	<atpType:#(AppBskyFeedDefsPostView AppBskyFeedDefsNotFoundPost AppBskyFeedDefsBlockedPost) format:nil>
	^ atpRoot
]

{ #category : #accessing }
AppBskyFeedDefsReplyRef >> atpRoot: anObject [
	atpRoot := anObject
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> parentDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#postView'.
				'#notFoundPost'.
				'#blockedPost'};
		label: 'Parent';
		accessor: #atpParent;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsReplyRef >> rootDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#postView'.
				'#notFoundPost'.
				'#blockedPost'};
		label: 'Root';
		accessor: #atpRoot;
		beRequired
]
