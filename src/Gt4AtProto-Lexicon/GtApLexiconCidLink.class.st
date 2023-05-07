Class {
	#name : #GtApLexiconCidLink,
	#superclass : #GtApLexiconCustomDefinition,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconCidLink class >> typeName [
	^ 'cid-link'
]

{ #category : #visiting }
GtApLexiconCidLink >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconCidLink: self
]

{ #category : #accessing }
GtApLexiconCidLink >> asClassName [
	^ 'String'
]

{ #category : #accessing }
GtApLexiconCidLink >> generateDescriptorFor: aString isRequired: aBoolean [
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
