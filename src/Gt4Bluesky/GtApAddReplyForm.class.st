Class {
	#name : #GtApAddReplyForm,
	#superclass : #Object,
	#instVars : [
		'isReadOnly',
		'url',
		'onAccept'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
GtApAddReplyForm >> asElement [
	^ self asGtMagritteViewModel asElement margin: (BlInsets all: 8)
]

{ #category : #accessing }
GtApAddReplyForm >> initialize [
	self isReadOnly: false.
	self url: ''
]

{ #category : #accessing }
GtApAddReplyForm >> isReadOnly [
	^ isReadOnly
]

{ #category : #accessing }
GtApAddReplyForm >> isReadOnly: anObject [
	isReadOnly := anObject
]

{ #category : #accessing }
GtApAddReplyForm >> magritteAcceptAction [
	<magritteActionDescription>
	^ super magritteAcceptAction
		onSuccessCallback: (GtMagritteCallback new
				action: [ :aModel :aButton :aMemento :aDescription | [ onAccept ifNotNil: [ onAccept value: self url ] ] on: Error do: #debug ])
]

{ #category : #accessing }
GtApAddReplyForm >> onAccept [
	^ onAccept
]

{ #category : #accessing }
GtApAddReplyForm >> onAccept: anObject [
	onAccept := anObject
]

{ #category : #accessing }
GtApAddReplyForm >> url [
	^ url
]

{ #category : #accessing }
GtApAddReplyForm >> url: anObject [
	url := anObject
]

{ #category : #accessing }
GtApAddReplyForm >> urlDescription [
	<magritteDescription>
	| description |
	description := MAStringDescription new
			label: 'Post URL';
			accessor: #url.
	self isReadOnly ifTrue: [ description beReadOnly ].
	^ description
]
