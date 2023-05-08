Class {
	#name : #GtApUserTimeline,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApUserTimeline class >> forPosts: aCollection [
	^ self new posts: aCollection
]

{ #category : #accessing }
GtApUserTimeline >> gtViewPostsSummaryUIFor: aView [
	<gtView>

	^ aView list
		title: 'Posts';
		priority: 1;
		items: [ posts ];
		itemStencil: [ 
			GtApPostSummaryListContainerElement new ];
		itemDataBinder: [ :aPostElement :aPost | 
			aPostElement post: aPost ].
]

{ #category : #accessing }
GtApUserTimeline >> posts [
	^ posts
]

{ #category : #accessing }
GtApUserTimeline >> posts: anObject [
	posts := anObject
]
