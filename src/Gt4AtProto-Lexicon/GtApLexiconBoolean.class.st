Class {
	#name : #GtApLexiconBoolean,
	#superclass : #GtApLexiconPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconBoolean class >> typeName [
	^ #boolean
]

{ #category : #accessing }
GtApLexiconBoolean >> generateDescriptorFor: aString isRequired: aBoolean [
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
