Class {
	#name : #GtApLexiconBoolean,
	#superclass : #GtApLexiconPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconBoolean class >> typeName [
	^ #boolean
]

{ #category : #visiting }
GtApLexiconBoolean >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconBoolean:  self
]

{ #category : #accessing }
GtApLexiconBoolean >> asClassName [
	^ 'Boolean'
]

{ #category : #accessing }
GtApLexiconBoolean >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MABooleanDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #' , aPrefix, aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]
