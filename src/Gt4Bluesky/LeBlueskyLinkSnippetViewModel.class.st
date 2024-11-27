Class {
	#name : #LeBlueskyLinkSnippetViewModel,
	#superclass : #LeSnippetViewModel,
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> actor [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> deletePost [
	self snippetModel client
		comAtprotoRepoDeleteRecordRepo: self actor atpDid
		collection: AppBskyFeedPostMain atpRecordName
		rkey: (#/ split: self post atpPost atpUri) last
		swapRecord: nil
		swapCommit: nil.
	self url: ''
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> isOwnPost [
	^ self post isNotNil
		and: [ self snippetModel client isNotNil
				and: [ self post author atpHandle = self snippetModel client handle ] ]
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> post [
	| path handle recordId did |
	self url isEmptyOrNil ifTrue: [ ^ nil ].
	path := '/' split: (self url removePrefix: 'https://bsky.app/').
	handle := path second.
	recordId := path last.
	self snippetModel client ifNil: [ ^ nil ].
	did := (self snippetModel client comAtprotoIdentityResolveHandleHandle: handle)
			at: 'did'.
	^ (self snippetModel client
		appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/' , recordId
		depth: nil
		parentHeight: nil) at: 'thread'
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> snippetElementClass [
	^ LeBlueskyLinkSnippetElement
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> url [
	^ self snippetModel url
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> url: aUrl [ 
	self snippetModel url: aUrl
]
