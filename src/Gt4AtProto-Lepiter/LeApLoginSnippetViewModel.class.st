Class {
	#name : #LeApLoginSnippetViewModel,
	#superclass : #LeSnippetViewModel,
	#instVars : [
		'blueskySnippet'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #accessing }
LeApLoginSnippetViewModel >> apSnippetModel: aSnippet [
	blueskySnippet := aSnippet
]

{ #category : #accessing }
LeApLoginSnippetViewModel >> initialize [
	super initialize.
]

{ #category : #accessing }
LeApLoginSnippetViewModel >> snippetElementClass [
	^ LeApLoginSnippetElement
]

{ #category : #accessing }
LeApLoginSnippetViewModel >> snippetModel [
	^ blueskySnippet 
]
