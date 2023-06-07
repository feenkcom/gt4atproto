Class {
	#name : #GtBlueskySnippetPageFilter,
	#superclass : #BrTextEditorInputFilter,
	#instVars : [
		'snippetElement'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
GtBlueskySnippetPageFilter >> filter: aString [
	<return: #String>
	| pageParser pageData aPage aDatabase |
	pageParser := '{{gtPage:' asPParser , '|' asPParser negate plus
			, '|db=' asPParser , '}}' asPParser negate plus , '}}' asPParser.
	pageParser := (pageParser
			==> [ :anArray | 
				{'' join: anArray second.
					'' join: anArray fourth} ]) optimize.
	pageData := pageParser parse: aString.

	pageData isPetit2Failure ifTrue: [ ^ aString ].

	aDatabase := LeDatabasesRegistry defaultLogicalDatabase
			databaseWithID: pageData second.

	aPage := (pageData first beginsWith: 'id=')
			ifTrue: [ aDatabase pageWithID: (pageData first removePrefix: 'id=') ]
			ifFalse: [ aDatabase pageNamed: pageData first ].

	self snippetElement addEmbeddedPage: aPage.
	^ ''
]

{ #category : #accessing }
GtBlueskySnippetPageFilter >> snippetElement [
	^ snippetElement
]

{ #category : #accessing }
GtBlueskySnippetPageFilter >> snippetElement: anObject [
	snippetElement := anObject
]
