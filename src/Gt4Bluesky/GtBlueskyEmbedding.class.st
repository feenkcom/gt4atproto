Class {
	#name : #GtBlueskyEmbedding,
	#superclass : #Object,
	#instVars : [
		'snippet',
		'snippetViewModel'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding class >> blueskyRecord [
	^ nil
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding class >> findEmbeddingFor: anEmbedding [
	self
		allSubclassesDo: [ :aClass | 
			aClass hasAbstractMethods
				ifFalse: [ (anEmbedding isKindOf: aClass blueskyRecord) ifTrue: [ ^ aClass ] ] ].

	^ self error: 'Unknown embedding!'
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding >> asElement [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding >> asJson [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ self asElement ]
]

{ #category : #accessing }
GtBlueskyEmbedding >> snippet [
	^ snippet
]

{ #category : #accessing }
GtBlueskyEmbedding >> snippet: anObject [
	snippet := anObject
]

{ #category : #accessing }
GtBlueskyEmbedding >> snippetViewModel [
	^ snippetViewModel
]

{ #category : #accessing }
GtBlueskyEmbedding >> snippetViewModel: anObject [
	snippetViewModel := anObject
]

{ #category : #'as yet unclassified' }
GtBlueskyEmbedding >> upload [
]
