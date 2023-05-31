Class {
	#name : #GtApLexiconModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #announcer }
GtApLexiconModel >> announcer [
	^ announcer
]

{ #category : #initialization }
GtApLexiconModel >> initialize [
	super initialize.
	announcer := Announcer new
]

{ #category : #testing }
GtApLexiconModel >> isLexiconDefinition [
	^ false
]

{ #category : #testing }
GtApLexiconModel >> isLexiconDirectory [
	^ false
]

{ #category : #testing }
GtApLexiconModel >> isLexiconFile [
	^ false
]

{ #category : #accessing }
GtApLexiconModel >> lexiconDirectory [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApLexiconModel >> lexiconFile [
	^ nil
]
