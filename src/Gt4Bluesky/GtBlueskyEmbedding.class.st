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
