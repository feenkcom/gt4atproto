Class {
	#name : #GtApLexiconUnknownDefinition,
	#superclass : #GtApLexiconDefinition,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconUnknownDefinition class >> typeName [
	^ #unknown
]

{ #category : #visiting }
GtApLexiconUnknownDefinition >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconUnknownDefinition:  self
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> asClassName [
	^ 'Object'
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> generateDescriptorFor: aString isRequired: aBoolean [
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
