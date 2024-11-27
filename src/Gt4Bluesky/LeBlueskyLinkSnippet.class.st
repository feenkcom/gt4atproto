Class {
	#name : #LeBlueskyLinkSnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'url',
		'client'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet class >> contextMenuItemSpefication [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'Bluesky link'
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#url -> #url);
		yourself
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet class >> leJsonV4Name [
	^ 'bskyPostSnippet'
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeBlueskyLinkSnippetViewModel new snippetModel: self
]

{ #category : #accessing }
LeBlueskyLinkSnippet >> client [
	^ client
]

{ #category : #accessing }
LeBlueskyLinkSnippet >> client: anObject [
	client := anObject
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet >> contentAsString [
	^ self url ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet >> initialize [
	super initialize.
	
	url := ''.
	
	self initializeClient
]

{ #category : #'as yet unclassified' }
LeBlueskyLinkSnippet >> initializeClient [
	client := (GtIdentityRegistry uniqueInstance firstOfType: GtBlueskyIdentity)
			ifNotNil: #createClient
]

{ #category : #accessing }
LeBlueskyLinkSnippet >> text [
	^ self url
]

{ #category : #accessing }
LeBlueskyLinkSnippet >> url [
	^ url
]

{ #category : #accessing }
LeBlueskyLinkSnippet >> url: anObject [
	url := anObject
]
