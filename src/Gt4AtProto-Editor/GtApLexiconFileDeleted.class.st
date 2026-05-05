Class {
	#name : 'GtApLexiconFileDeleted',
	#superclass : 'Announcement',
	#instVars : [
		'lexiconFile'
	],
	#category : 'Gt4AtProto-Editor-Event',
	#package : 'Gt4AtProto-Editor',
	#tag : 'Event'
}

{ #category : 'accessing' }
GtApLexiconFileDeleted >> lexiconFile [
	^ lexiconFile
]

{ #category : 'accessing' }
GtApLexiconFileDeleted >> lexiconFile: anObject [
	lexiconFile := anObject
]
