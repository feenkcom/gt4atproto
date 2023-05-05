Class {
	#name : #GtApLexiconData,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'accept',
		'maxSize'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconData >> accept [
	^ accept
]

{ #category : #accessing }
GtApLexiconData >> accept: anObject [
	accept := anObject
]

{ #category : #accessing }
GtApLexiconData >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAFileDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #atProto' , aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconData >> maxSize [
	^ maxSize
]

{ #category : #accessing }
GtApLexiconData >> maxSize: anObject [
	maxSize := anObject
]
