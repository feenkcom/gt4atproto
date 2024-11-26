Class {
	#name : #AppBskyActorDefsFeedViewPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpFeed',
		'atpHideReplies',
		'atpHideRepliesByUnfollowed',
		'atpHideRepliesByLikeCount',
		'atpHideReposts',
		'atpHideQuotePosts'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsFeedViewPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#feedViewPref'
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref class >> atpSchema [
 ^ '{"type":"object","required":["feed"],"properties":{"feed":{"type":"string","description":"The URI of the feed, or an identifier which describes the feed."},"hideReplies":{"type":"boolean","description":"Hide replies in the feed."},"hideRepliesByUnfollowed":{"type":"boolean","description":"Hide replies in the feed if they are not by followed users.","default":true},"hideRepliesByLikeCount":{"type":"integer","description":"Hide replies in the feed if they do not have this number of likes."},"hideReposts":{"type":"boolean","description":"Hide reposts in the feed."},"hideQuotePosts":{"type":"boolean","description":"Hide quote posts in the feed."}}}'
]

{ #category : #serialization }
AppBskyActorDefsFeedViewPref class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpFeed: (aRequest at: 'feed' ifAbsent: [ nil ]);
		atpHideReplies: (aRequest at: 'hideReplies' ifAbsent: [ nil ]);
		atpHideRepliesByUnfollowed: (aRequest at: 'hideRepliesByUnfollowed' ifAbsent: [ nil ]);
		atpHideRepliesByLikeCount: (aRequest at: 'hideRepliesByLikeCount' ifAbsent: [ nil ]);
		atpHideReposts: (aRequest at: 'hideReposts' ifAbsent: [ nil ]);
		atpHideQuotePosts: (aRequest at: 'hideQuotePosts' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpFeed [
	<atpType:#String format:nil>
	^ atpFeed
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpFeed: anObject [
	atpFeed := anObject
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideQuotePosts [
	<atpType:#Boolean format:nil>
	^ atpHideQuotePosts
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideQuotePosts: anObject [
	atpHideQuotePosts := anObject
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideReplies [
	<atpType:#Boolean format:nil>
	^ atpHideReplies
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideReplies: anObject [
	atpHideReplies := anObject
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideRepliesByLikeCount [
	<atpType:#Number format:nil>
	^ atpHideRepliesByLikeCount
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideRepliesByLikeCount: anObject [
	atpHideRepliesByLikeCount := anObject
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideRepliesByUnfollowed [
	<atpType:#Boolean format:nil>
	^ atpHideRepliesByUnfollowed
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideRepliesByUnfollowed: anObject [
	atpHideRepliesByUnfollowed := anObject
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideReposts [
	<atpType:#Boolean format:nil>
	^ atpHideReposts
]

{ #category : #accessing }
AppBskyActorDefsFeedViewPref >> atpHideReposts: anObject [
	atpHideReposts := anObject
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> feedDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Feed';
		accessor: #atpFeed;
		beRequired
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> hideQuotePostsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'HideQuotePosts';
		accessor: #atpHideQuotePosts
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> hideRepliesByLikeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'HideRepliesByLikeCount';
		accessor: #atpHideRepliesByLikeCount
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> hideRepliesByUnfollowedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'HideRepliesByUnfollowed';
		accessor: #atpHideRepliesByUnfollowed
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> hideRepliesDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'HideReplies';
		accessor: #atpHideReplies
]

{ #category : #magritte }
AppBskyActorDefsFeedViewPref >> hideRepostsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'HideReposts';
		accessor: #atpHideReposts
]
