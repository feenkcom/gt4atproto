Class {
	#name : #GtApLexiconFileDeleted,
	#superclass : #Announcement,
	#instVars : [
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-Event'
}

{ #category : #accessing }
GtApLexiconFileDeleted >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApLexiconFileDeleted >> lexiconFile: anObject [
	lexiconFile := anObject
]
