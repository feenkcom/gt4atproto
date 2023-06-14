Class {
	#name : #GtApPagesRestCall,
	#superclass : #GtApListRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApPagesRestCall class >> errors [
	^ #()
]

{ #category : #accessing }
GtApPagesRestCall class >> modelEntity [
	^ LePage
]

{ #category : #accessing }
GtApPagesRestCall class >> parameters [
	^ #() asDictionary
]

{ #category : #accessing }
GtApPagesRestCall class >> pattern [
	^ #('pages')
]

{ #category : #accessing }
GtApPagesRestCall >> list [
	| database |
	database := self delegate database.

	^ database pages
]
