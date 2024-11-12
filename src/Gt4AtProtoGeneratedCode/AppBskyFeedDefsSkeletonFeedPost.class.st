Class {
	#name : #AppBskyFeedDefsSkeletonFeedPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPost',
		'atpReason',
		'atpFeedContext'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost class >> atpRecordName [
 ^ 'app.bsky.feed.defs#skeletonFeedPost'
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost class >> atpSchema [
 ^ '{"type":"object","required":["post"],"properties":{"post":{"type":"string","format":"at-uri"},"reason":{"type":"union","refs":["#skeletonReasonRepost","#skeletonReasonPin"]},"feedContext":{"type":"string","description":"Context that will be passed through to client and may be passed to feed generator back alongside interactions.","maxLength":2000}}}'
]

{ #category : #serialization }
AppBskyFeedDefsSkeletonFeedPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPost: (aRequest at: 'post' ifAbsent: [ nil ]);
		atpReason: (aRequest
				at: 'reason'
				ifPresent: [ :aValue | 
					({'app.bsky.feed.defs#skeletonReasonRepost'
							-> AppBskyFeedDefsSkeletonReasonRepost.
						'app.bsky.feed.defs#skeletonReasonPin' -> AppBskyFeedDefsSkeletonReasonPin}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpFeedContext: (aRequest at: 'feedContext' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpFeedContext [
	<atpType:#String format:nil>
	^ atpFeedContext
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpFeedContext: anObject [
	atpFeedContext := anObject
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpPost [
	<atpType:#String format:'at-uri'>
	^ atpPost
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpPost: anObject [
	atpPost := anObject
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpReason [
	<atpType:#(AppBskyFeedDefsSkeletonReasonRepost AppBskyFeedDefsSkeletonReasonPin) format:nil>
	^ atpReason
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #magritte }
AppBskyFeedDefsSkeletonFeedPost >> feedContextDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'FeedContext';
		accessor: #atpFeedContext
]

{ #category : #magritte }
AppBskyFeedDefsSkeletonFeedPost >> postDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Post';
		accessor: #atpPost;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsSkeletonFeedPost >> reasonDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#skeletonReasonRepost'.
				'#skeletonReasonPin'};
		label: 'Reason';
		accessor: #atpReason
]
