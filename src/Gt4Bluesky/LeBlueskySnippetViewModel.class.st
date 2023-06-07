Class {
	#name : #LeBlueskySnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'cursor',
		'card',
		'embeddedPost',
		'embeddedPage'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetViewModel >> addCard: aCard [
	card := aCard.
	self snippetModel files: OrderedCollection new.
	self removeEmbeddedPost.
	self removeEmbeddedPage
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> addEmbeddedPage: aPage [
	embeddedPage := aPage.
	self snippetModel files: OrderedCollection new.
	self removeEmbeddedPost.
	self removeCard
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> addEmbeddedPost: aPost [
	embeddedPost := aPost.
	self snippetModel files: OrderedCollection new.
	self removeCard.
	self removeEmbeddedPage
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> card [
	^ card
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> cursor [
	^ cursor
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> embeddedPage [
	^ embeddedPage
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> embeddedPost [
	^ embeddedPost
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> moveCursorAt: aCursorPosition [
	self cursor: (BrTextEditorCursor at: aCursorPosition).
	self announce: LeBlueskySnippetCursorChanged new
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetClientChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetFilesChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetModelChanged [
	super onSnippetModelChanged.
	
	self refreshEmbedsFromModel
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetPostChanged: anObject [
	self refreshEmbedsFromModel.
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetTextChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> refreshEmbedsFromModel [
	self snippetModel hasPost
		ifTrue: [ self snippetModel atpPost atpPost atpRecord atpEmbed
				ifNotNil: [ :anEmbed | 
					(anEmbed isKindOf: AppBskyEmbedRecordView)
						ifTrue: [ self addEmbeddedPost: anEmbed ].

					(anEmbed isKindOf: AppBskyEmbedExternalView)
						ifTrue: [ self addCard: (GtApExternalWebsiteCard fromExternal: anEmbed) ].

					((anEmbed isKindOf: GtApUnknownRecord)
						and: [ anEmbed key = 'com.gtoolkit.embed.lepiterPage' ])
						ifTrue: [ | stringStream |
							stringStream := (anEmbed rawData at: 'record') readStream.
							self addEmbeddedPage: (LeJsonV4 uniqueInstance deserialize: stringStream).
							stringStream close ] ].
			self announce: LeBlueskySnippetPostChanged new ]
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> removeCard [
	card := nil
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> removeEmbeddedPage [
	embeddedPage := nil
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> removeEmbeddedPost [
	embeddedPost := nil
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> snippetElementClass [
	^ LeBlueskySnippetElement
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> subscribeToSnippetModel [
	super subscribeToSnippetModel.
	
	self snippetModel weak
		when: LeBlueskySnippetClientChanged 
			send: #onSnippetClientChanged: 
			to: self.
	
	self snippetModel weak
		when: LeBlueskySnippetPostChanged 
			send: #onSnippetPostChanged: 
			to: self.
			
	self snippetModel weak
		when: LeBlueskySnippetTextChanged 
			send: #onSnippetTextChanged: 
			to: self.
			
	self snippetModel weak
		when: LeBlueskySnippetFilesChanged 
			send: #onSnippetFilesChanged: 
			to: self
]
