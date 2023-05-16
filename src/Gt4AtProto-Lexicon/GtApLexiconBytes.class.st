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

{ #category : #visiting }
GtApLexiconBytes >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconBytes: self
]

{ #category : #accessing }
GtApLexiconBytes >> asClassName [
	^ 'ByteArray'
]

{ #category : #accessing }
GtApLexiconBytes >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey , ''' ifAbsent: [ nil ]'
]

{ #category : #accessing }
GtApLexiconBytes >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAFileDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #' , aPrefix, aString asCamelCase.

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
