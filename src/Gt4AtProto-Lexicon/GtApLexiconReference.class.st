Class {
	#name : #GtApLexiconReference,
	#superclass : #Object,
	#instVars : [
		'referenceString',
		'referencedEntity'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconReference >> asClassName [
	^ (self referenceString replaceAllRegex: '[.#]' with: ' ') asCamelCase
]

{ #category : #accessing }
GtApLexiconReference >> generateDescriptorFor: aString isRequired: aBoolean [
	^ aString, 'Description
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: ''' , aString capitalized
		, '''' , (aBoolean ifTrue: [ ';
		beRequired' ] ifFalse: [ '' ])
]

{ #category : #accessing }
GtApLexiconReference >> generateGetterAs: aString [
	^ aString
		, '
	<referenceTo:''' , self referenceString
		, '''>
	^ ', aString
]

{ #category : #accessing }
GtApLexiconReference >> generateSetterAs: aString [
	^ aString
		, ': anObject
	<referenceTo:''' , self referenceString
		, '''>
	', aString, ' := anObject'
]

{ #category : #printing }
GtApLexiconReference >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self referenceString]
]

{ #category : #accessing }
GtApLexiconReference >> referenceString [
	^ referenceString
]

{ #category : #accessing }
GtApLexiconReference >> referenceString: anObject [
	referenceString := anObject
]
