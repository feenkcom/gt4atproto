Class {
	#name : #AppBskyFeedDefsThreadViewPost,
	#superclass : #GtApModelEntity,
	#traits : 'TAppBskyFeedDefsThreadViewPost',
	#classTraits : 'TAppBskyFeedDefsThreadViewPost classTrait',
	#instVars : [
		'atpPost',
		'atpParent',
		'atpReplies'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#threadViewPost'
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost class >> atpSchema [
 ^ '{"type":"object","required":["post"],"properties":{"post":{"type":"ref","ref":"#postView"},"parent":{"type":"union","refs":["#threadViewPost","#notFoundPost","#blockedPost"]},"replies":{"type":"array","items":{"type":"union","refs":["#threadViewPost","#notFoundPost","#blockedPost"]}}}}'
]

{ #category : #serialization }
AppBskyFeedDefsThreadViewPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest
				at: 'post'
				ifPresent: [ :aValue | AppBskyFeedDefsPostView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpParent: (aRequest
				at: 'parent'
				ifPresent: [ :aValue | 
					({'app.bsky.feed.defs#threadViewPost' -> AppBskyFeedDefsThreadViewPost.
						'app.bsky.feed.defs#notFoundPost' -> AppBskyFeedDefsNotFoundPost.
						'app.bsky.feed.defs#blockedPost' -> AppBskyFeedDefsBlockedPost}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReplies: (aRequest
				at: 'replies'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | 
							({'app.bsky.feed.defs#threadViewPost' -> AppBskyFeedDefsThreadViewPost.
								'app.bsky.feed.defs#notFoundPost' -> AppBskyFeedDefsNotFoundPost.
								'app.bsky.feed.defs#blockedPost' -> AppBskyFeedDefsBlockedPost}
								asDictionary at: (aValue at: '$type')) fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpParent [
	<atpType:#(AppBskyFeedDefsThreadViewPost AppBskyFeedDefsNotFoundPost AppBskyFeedDefsBlockedPost) format:nil>
	^ atpParent
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpParent: anObject [
	atpParent := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpPost [
	<referenceTo:'#postView'>
	<atpType:#AppBskyFeedDefsPostView format:nil>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpPost: anObject [
	<referenceTo:'#postView'>
	atpPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpReplies [
	<atpType:#(AppBskyFeedDefsThreadViewPost AppBskyFeedDefsNotFoundPost AppBskyFeedDefsBlockedPost) format:nil>
	<atpCollection>
	^ atpReplies
]

{ #category : #accessing }
AppBskyFeedDefsThreadViewPost >> atpReplies: anObject [
	atpReplies := anObject
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> parentDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#threadViewPost'.
				'#notFoundPost'.
				'#blockedPost'};
		label: 'Parent';
		accessor: #atpParent
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> postDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsThreadViewPost >> repliesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyFeedDefsThreadViewPost AppBskyFeedDefsNotFoundPost
					AppBskyFeedDefsBlockedPost};
		label: 'Replies';
		accessor: #atpReplies
]
