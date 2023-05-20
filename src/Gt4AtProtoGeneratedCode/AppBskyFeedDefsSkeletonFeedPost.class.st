Class {
	#name : #AppBskyFeedDefsSkeletonFeedPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPost',
		'atpReason'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost class >> atpDescription [
 ^ ''
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
 ^ '{"type":"object","required":["post"],"properties":{"post":{"type":"string","format":"at-uri"},"reason":{"type":"union","refs":["#skeletonReasonRepost"]}}}'
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
							-> AppBskyFeedDefsSkeletonReasonRepost} asDictionary
						at: (aValue at: '$type')) fromRequest: aValue ]
				ifAbsent: [ nil ])
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
	<atpType:#(AppBskyFeedDefsSkeletonReasonRepost) format:nil>
	^ atpReason
]

{ #category : #accessing }
AppBskyFeedDefsSkeletonFeedPost >> atpReason: anObject [
	atpReason := anObject
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
		options: {'#skeletonReasonRepost'};
		label: 'Reason';
		accessor: #atpReason
]
