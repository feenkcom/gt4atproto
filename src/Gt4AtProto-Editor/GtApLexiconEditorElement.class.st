Class {
	#name : #GtApLexiconEditorElement,
	#superclass : #BrEditor,
	#instVars : [
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-View'
}

{ #category : #initialization }
GtApLexiconEditorElement >> lexiconFile: anObject [
	lexiconFile := anObject.
	self aptitude: (GtApEditorAptitude new lexiconFile: lexiconFile).
	self text: lexiconFile source.
	lexiconFile announcer weak
		when: GtApLexiconFileSourceChanged
		send: #updateText:
		to: self
]

{ #category : #private }
GtApLexiconEditorElement >> updateText: sourceChanged [
	self editor text asString = sourceChanged lexiconFile source ifTrue: [ ^ self ].
	self editor text: sourceChanged lexiconFile source asRopedText
]
