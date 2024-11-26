Class {
	#name : #LeBlueskyPostSnippetViewModel,
	#superclass : #LeSnippetViewModel,
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> post [
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
LeBlueskyPostSnippetViewModel >> snippetElementClass [
	^ LeBlueskyPostSnippetElement
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> url [
	^ self snippetModel url
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> url: aUrl [ 
	self snippetModel url: aUrl
]
