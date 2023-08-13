Class {
	#name : #GtApRestModelCollection,
	#superclass : #GtApRestModel,
	#instVars : [
		'collection'
	],
	#category : #'Gt4AtProto-RestCall - Model'
}

{ #category : #accessing }
GtApRestModelCollection class >> for: aCollection [
	^ self new collection: aCollection
]

{ #category : #accessing }
GtApRestModelCollection >> asLexiconOutputIn: aGenerator [
	^ GtApLexiconArray new items: (self collection asLexiconOutputIn: aGenerator)
]

{ #category : #accessing }
GtApRestModelCollection >> collection [
	^ collection
]

{ #category : #accessing }
GtApRestModelCollection >> collection: anObject [
	collection := anObject
]
