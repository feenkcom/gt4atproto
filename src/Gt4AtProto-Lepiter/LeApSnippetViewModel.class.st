Class {
	#name : #LeApSnippetViewModel,
	#superclass : #LeSnippetViewModel,
	#instVars : [
		'blueskySnippet'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #accessing }
LeApSnippetViewModel >> apSnippetModel: aSnippet [
	blueskySnippet := aSnippet
]

{ #category : #accessing }
LeApSnippetViewModel >> initialize [
	super initialize.
]

{ #category : #accessing }
LeApSnippetViewModel >> snippetElementClass [
	^ LeApSnippetElement
]

{ #category : #accessing }
LeApSnippetViewModel >> snippetModel [
	^ blueskySnippet 
]
