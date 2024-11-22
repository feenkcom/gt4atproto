Class {
	#name : #LeBlueskySnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'cursor',
		'embed'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskySnippetViewModel >> cursor [
	^ cursor
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> embed [
	^ embed
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> embed: anObject [
	embed := anObject
]

{ #category : #'as yet unclassified' }
LeBlueskySnippetViewModel >> gtEmbedFor: aView [
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
LeBlueskySnippetViewModel >> hasEmbed [
	^ self embed notNil
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> moveCursorAt: aCursorPosition [
	self cursor: (BrTextEditorCursor at: aCursorPosition).
	self announce: LeBlueskySnippetCursorChanged new
]

{ #category : #accessing }
LeBlueskySnippetViewModel >> onSnippetClientChanged: anObject [
	self refreshEmbedsFromModel.
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
	(self snippetModel hasPost and: [ self snippetModel hasClient ])
		ifTrue: [ self snippetModel atpPost atpPost atpRecord atpEmbed
				ifNotNil: [ :anEmbed | 
					self
						embed: ((GtBlueskyEmbedding findEmbeddingFor: anEmbed)
								fromRecord: self snippetModel atpPost
								inViewModel: self) ].

			self announce: LeBlueskySnippetPostChanged new ]
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
