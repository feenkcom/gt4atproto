Class {
	#name : #LeBlueskyLinkSnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'post'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> actor [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> client [
	^ self snippetModel client
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
LeBlueskyLinkSnippetViewModel >> initializePost [
	| handle path recordId did |
	self url isEmptyOrNil ifTrue: [ ^ nil ].
	path := '/' split: (self url removePrefix: 'https://bsky.app/').
	handle := path second.
	recordId := path last.
	self snippetModel client ifNil: [ ^ nil ].
	did := (self snippetModel client comAtprotoIdentityResolveHandleHandle: handle)
			at: 'did'.
	post := (self snippetModel client
			appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/'
					, recordId
			depth: nil
			parentHeight: nil) at: 'thread'.
	^ post
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> isOwnPost [
	^ self post isNotNil
		and: [ self snippetModel client isNotNil
				and: [ self post author atpHandle = self snippetModel client handle ] ]
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> parent [
	self post ifNil: [ ^ nil ].

	^ self post atpParent
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippetViewModel >> post [
	^ post ifNil: [ ^ self initializePost ]
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
	self snippetModel url: aUrl.
	self initializePost
]
