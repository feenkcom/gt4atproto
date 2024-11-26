Class {
	#name : #LeBlueskyPostSnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'url'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#url -> #url);
		yourself
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet class >> leJsonV4Name [
	^ 'bskyPostSnippet'
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeBlueskyPostSnippetViewModel new snippetModel: self
]

{ #category : #accessing }
LeBlueskyPostSnippet >> url [
	^ url
]

{ #category : #accessing }
LeBlueskyPostSnippet >> url: anObject [
	url := anObject
]
