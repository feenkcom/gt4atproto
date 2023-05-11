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
	^ aView explicit
		title: 'Posts';
		priority: 1;
		stencil: [  
			BrSimpleList new
				stream: self posts;
				itemStencil: [ GtApPostSummaryListContainerElement new ];
				itemDataBinder: [ :aPostElement :aPost | aPostElement post: aPost; when: BlClickEvent do: [ :e | e target phlow spawnObject: aPostElement post ] ] ]
]

{ #category : #accessing }
GtApUserTimeline >> posts [
	^ posts
]

{ #category : #accessing }
GtApUserTimeline >> posts: anObject [
	posts := anObject
]
