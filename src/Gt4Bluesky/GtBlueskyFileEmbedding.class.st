Class {
	#name : #GtBlueskyFileEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'file'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyFileEmbedding >> asElement [
	^ BrHorizontalPane new
		hMatchParent;
		vExact: 200;
		clipChildren: false;
		margin: (BlInsets all: 5);
		addChild: self fileElement
]

{ #category : #accessing }
GtBlueskyFileEmbedding >> file [
	^ file
]

{ #category : #accessing }
GtBlueskyFileEmbedding >> file: anObject [
	self snippet clearFiles addFile: anObject.
	file := anObject
]

{ #category : #'as yet unclassified' }
GtBlueskyFileEmbedding >> fileElement [
	^ self subclassResponsibility
]
