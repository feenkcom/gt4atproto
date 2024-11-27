Class {
	#name : #LeBlueskyPostSnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'cursor',
		'embed'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> actor [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> cursor [
	^ cursor
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> embed [
	^ embed
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> embed: anObject [
	embed := anObject
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> gtEmbedFor: aView [
	<gtView>
	self embed ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Embed';
		priority: 5;
		object: [ self embed ];
		view: #gtPreviewFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect embed'
			action: [ :aButton | aButton phlow spawnObject: self embed ]
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> hasEmbed [
	^ self embed notNil
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> moveCursorAt: aCursorPosition [
	self cursor: (BrTextEditorCursor at: aCursorPosition).
	self announce: LeBlueskySnippetCursorChanged new
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> onSnippetClientChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> onSnippetFilesChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> onSnippetPostChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> onSnippetTextChanged: anObject [
	self announce: anObject
]

{ #category : #'as yet unclassified' }
LeBlueskyPostSnippetViewModel >> post [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> snippetElementClass [
	^ LeBlueskyPostSnippetElement
]

{ #category : #accessing }
LeBlueskyPostSnippetViewModel >> subscribeToSnippetModel [
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
