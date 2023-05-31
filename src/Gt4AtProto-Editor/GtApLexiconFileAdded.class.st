Class {
	#name : #GtApLexiconFileAdded,
	#superclass : #Announcement,
	#instVars : [
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-Event'
}

{ #category : #accessing }
GtApLexiconFileAdded >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApLexiconFileAdded >> lexiconFile: anObject [
	lexiconFile := anObject
]
