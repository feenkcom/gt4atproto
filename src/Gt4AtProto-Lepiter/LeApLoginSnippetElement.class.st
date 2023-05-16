Class {
	#name : #LeApLoginSnippetElement,
	#superclass : #LeSnippetElement,
	#instVars : [
		'formElement'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #accessing }
LeApLoginSnippetElement >> initialize [
	| form |
	super initialize.
	form := GtApLoginForm new
			clientCallback: [" :aClient :anElement | anElement phlow spawnObject: (GtApUser new client: aClient) "
			 :aClient :anElement |
		anElement phlow
			spawnObject: ((aClient appBskyActorGetProfileActor: aClient context handle) client: aClient)  ].
	formElement := form asGtMagritteViewModel asElement margin: (BlInsets all: 10).
]

{ #category : #accessing }
LeApLoginSnippetElement >> snippetContent [
	^ formElement
]

{ #category : #accessing }
LeApLoginSnippetElement >> snippetToolbar [
	^ nil
]
