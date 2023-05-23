Class {
	#name : #GtApPostsStream,
	#superclass : #Object,
	#traits : 'TGtStreamGroup',
	#classTraits : 'TGtStreamGroup classTrait',
	#instVars : [
		'stream'
	],
	#category : #'Gt4AtProto-Streams'
}

{ #category : #accessing }
GtApPostsStream class >> posts: aStream [
	^ self new stream: aStream
]

{ #category : #accessing }
GtApPostsStream >> asyncSimilarCopy [
	^ GtApPostsStream posts: self stream asyncSimilarCopy
]

{ #category : #accessing }
GtApPostsStream >> gtViewCardPostsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Post cards';
		priority: 1;
		stencil: [ BrSimpleList new
				stream: self stream asyncSimilarCopy;
				itemStencil: [ GtApFeedPostSummaryElement new withShadowAndHighlighting ];
				itemDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						withSpawnHandlers ] ]
]

{ #category : #accessing }
GtApPostsStream >> stream [
	^ stream
]

{ #category : #accessing }
GtApPostsStream >> stream: aStream [
	stream := aStream
]
