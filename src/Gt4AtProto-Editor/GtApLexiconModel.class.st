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
	^ announcer ifNil: [ announcer := Announcer new ]
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

{ #category : #testing }
GtApLexiconModel >> isReference: aStringNode [
	(aStringNode isKindOf: JSONStringNode) ifFalse: [ ^ false ].
	(aStringNode value source includes: $#) ifTrue: [ ^ true ].
	((aStringNode parent isKindOf: JSONMemberNode)
		and: [ aStringNode parent name source = '"ref"' ]) ifTrue: [ ^ true ].
	^ (aStringNode parent isKindOf: JSONArrayNode)
		and: [ (aStringNode parent parent isKindOf: JSONMemberNode)
				and: [ aStringNode parent parent name source = '"refs"' ] ]
]

{ #category : #accessing }
GtApLexiconModel >> lexiconDirectory [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApLexiconModel >> lexiconFile [
	^ nil
]
