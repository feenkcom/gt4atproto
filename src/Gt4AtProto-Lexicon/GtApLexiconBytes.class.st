Class {
	#name : #GtApLexiconBytes,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'maxLength'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconBytes class >> typeName [
	^ #bytes
]

{ #category : #accessing }
GtApLexiconBytes >> generateDescriptorFor: aString isRequired: aBoolean [
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
GtApLexiconBytes >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconBytes >> maxLength: anObject [
	maxLength := anObject
]
