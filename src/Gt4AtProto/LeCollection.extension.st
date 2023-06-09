Extension { #name : #LeCollection }

{ #category : #'*Gt4AtProto' }
LeCollection class >> asLexiconPropertyIn: aGenerator [
	(aGenerator classes includes: LeContent)
		ifFalse: [ aGenerator addClass: LeContent ].
	^ GtApLexiconArray new
		items: (GtApLexiconDefinitionReference new
				referenceString: (aGenerator idFromClassName: LeContent name withSeparator: '#'))
]
