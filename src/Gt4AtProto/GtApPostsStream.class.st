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
GtApPostsStream >> stream [
	^ stream
]

{ #category : #accessing }
GtApPostsStream >> stream: aStream [
	stream := aStream
]
