Class {
	#name : #GtApLexiconString,
	#superclass : #GtApLexiconPrimitive,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconString class >> typeName [
	^ #string
]

{ #category : #visiting }
GtApLexiconString >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconString:  self
]

{ #category : #accessing }
GtApLexiconString >> asClassName [
	^ 'String'
]

{ #category : #accessing }
GtApLexiconString >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAStringDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #' , aPrefix , aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconString >> typePragma [
	^ '<atpType:''string'' format:'
		, (self rawData
				at: 'format'
				ifPresent: [ :aFormat | '''' , aFormat , '''' ]
				ifAbsent: [ 'nil' ]) , '>'
]
