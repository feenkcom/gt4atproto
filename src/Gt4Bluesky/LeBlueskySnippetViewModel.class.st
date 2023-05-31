Class {
	#name : #LeBlueskySnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'cursor',
		'card'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetViewModel >> addCard: aCard [
	card := aCard.
	self snippetModel files: OrderedCollection new
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> card [
	^ card
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> cards [
	^ cards
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
LeBlueskySnippetViewModel >> onSnippetPostChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetTextChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> removeCard [
	card := nil
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
