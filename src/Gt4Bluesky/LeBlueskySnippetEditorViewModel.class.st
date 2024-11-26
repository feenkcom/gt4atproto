Class {
	#name : #LeBlueskySnippetEditorViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'cursor',
		'embed'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #'as yet unclassified' }
LeBlueskySnippetEditorViewModel >> actor [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> cursor [
	^ cursor
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> embed [
	^ embed
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> embed: anObject [
	embed := anObject
]

{ #category : #'as yet unclassified' }
LeBlueskySnippetEditorViewModel >> gtEmbedFor: aView [
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
LeBlueskySnippetEditorViewModel >> hasEmbed [
	^ self embed notNil
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> moveCursorAt: aCursorPosition [
	self cursor: (BrTextEditorCursor at: aCursorPosition).
	self announce: LeBlueskySnippetCursorChanged new
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> onSnippetClientChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> onSnippetFilesChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> onSnippetPostChanged: anObject [
	self announce: anObject
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> onSnippetTextChanged: anObject [
	self announce: anObject
]

{ #category : #'as yet unclassified' }
LeBlueskySnippetEditorViewModel >> post [
	^ self snippetModel client
		appBskyActorGetProfileActor: self snippetModel client handle
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> snippetElementClass [
	^ LeBlueskySnippetEditorElement
]

{ #category : #accessing }
LeBlueskySnippetEditorViewModel >> subscribeToSnippetModel [
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
