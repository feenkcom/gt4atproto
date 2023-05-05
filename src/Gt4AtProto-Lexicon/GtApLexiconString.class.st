Class {
	#name : #GtApLexiconString,
	#superclass : #GtApLexiconPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconString class >> typeName [
	^ #string
]

{ #category : #accessing }
GtApLexiconString >> asClassName [
	^ 'String'
]

{ #category : #accessing }
GtApLexiconString >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAStringDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #atProto' , aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]
