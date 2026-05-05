Class {
	#name : 'GtApLexiconFileSaved',
	#superclass : 'Announcement',
	#instVars : [
		'lexiconFile'
	],
	#category : 'Gt4AtProto-Editor-Event',
	#package : 'Gt4AtProto-Editor',
	#tag : 'Event'
}

{ #category : 'accessing' }
GtApLexiconFileSaved >> lexiconFile [
	^ lexiconFile
]

{ #category : 'accessing' }
GtApLexiconFileSaved >> lexiconFile: anObject [
	lexiconFile := anObject
]
