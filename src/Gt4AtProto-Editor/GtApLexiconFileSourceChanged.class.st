Class {
	#name : #GtApLexiconFileSourceChanged,
	#superclass : #Announcement,
	#instVars : [
		'oldSource',
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-Event'
}

{ #category : #accessing }
GtApLexiconFileSourceChanged >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApLexiconFileSourceChanged >> lexiconFile: aGtApLexiconFile [
	lexiconFile := aGtApLexiconFile
]

{ #category : #accessing }
GtApLexiconFileSourceChanged >> oldSource [
	^ oldSource
]

{ #category : #accessing }
GtApLexiconFileSourceChanged >> oldSource: aString [
	oldSource := aString
]
