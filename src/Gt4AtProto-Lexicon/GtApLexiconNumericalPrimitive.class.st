Class {
	#name : #GtApLexiconNumericalPrimitive,
	#superclass : #GtApLexiconPrimitive,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconNumericalPrimitive >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MABooleanDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #atProto' , aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]
