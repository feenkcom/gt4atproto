Class {
	#name : #GtApLexiconString,
	#superclass : #GtApLexiconPrimitive,
	#instVars : [
		'format'
	],
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
GtApLexiconString >> format [
	^ format
]

{ #category : #accessing }
GtApLexiconString >> format: anObject [
	format := anObject
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
GtApLexiconString >> generateJson [
	| json |
	json := {'type' -> 'string'} asDictionary.

	self format ifNotNil: [ :aFormat | json at: 'format' put: aFormat ].

	^ json
]

{ #category : #accessing }
GtApLexiconString >> typePragma [
	^ '<atpType:#String format:'
		, (self rawData
				at: 'format'
				ifPresent: [ :aFormat | '''' , aFormat , '''' ]
				ifAbsent: [ 'nil' ]) , '>'
]
