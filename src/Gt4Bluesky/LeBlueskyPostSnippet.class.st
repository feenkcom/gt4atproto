Class {
	#name : #LeBlueskyPostSnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'url',
		'client'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky post'
]

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
LeBlueskyPostSnippet >> client [
	^ client
]

{ #category : #accessing }
LeBlueskyPostSnippet >> client: anObject [
	client := anObject
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> contentAsString [
	^ self url ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> initialize [
	super initialize.
	
	url := ''.
	
	self initializeClient
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippet >> initializeClient [
	client := (GtIdentityRegistry uniqueInstance firstOfType: GtBlueskyIdentity)
			ifNotNil: #createClient
]

{ #category : #accessing }
LeBlueskyPostSnippet >> text [
	^ self url
]

{ #category : #accessing }
LeBlueskyPostSnippet >> url [
	^ url
]

{ #category : #accessing }
LeBlueskyPostSnippet >> url: anObject [
	url := anObject
]
