Class {
	#name : 'GtApLexiconFileAdded',
	#superclass : 'Announcement',
	#instVars : [
		'lexiconFile'
	],
	#category : 'Gt4AtProto-Editor-Event',
	#package : 'Gt4AtProto-Editor',
	#tag : 'Event'
}

{ #category : 'accessing' }
GtApLexiconFileAdded >> lexiconFile [
	^ lexiconFile
]

{ #category : 'accessing' }
GtApLexiconFileAdded >> lexiconFile: anObject [
	lexiconFile := anObject
]
