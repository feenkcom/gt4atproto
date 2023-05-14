Class {
	#name : #LeApSnippetElement,
	#superclass : #LeSnippetElement,
	#instVars : [
		'formElement'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #accessing }
LeApSnippetElement >> initialize [
	| form |
	super initialize.
	form := GtApLoginForm new
			clientCallback: [" :aClient :anElement | anElement phlow spawnObject: (GtApUser new client: aClient) "
			 :aClient :anElement |
		anElement phlow
			spawnObject: ((aClient appBskyActorGetProfileactor: aClient context handle) client: aClient)  ].
	formElement := form asGtMagritteViewModel asElement margin: (BlInsets all: 10).
]

{ #category : #accessing }
LeApSnippetElement >> snippetContent [
	^ formElement
]

{ #category : #accessing }
LeApSnippetElement >> snippetToolbar [
	^ nil
]
