Class {
	#name : #GtApLexiconReference,
	#superclass : #Object,
	#instVars : [
		'referencedEntity',
		'rawData',
		'ref'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconReference class >> typeName [
	^ #ref
]

{ #category : #accessing }
GtApLexiconReference >> asClassName [
	^ (self referenceString replaceAllRegex: '[.#]' with: ' ') asCamelCase
]

{ #category : #accessing }
GtApLexiconReference >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconReference >> generateDescriptorFor: aString isRequired: aBoolean [
	^ aString, 'Description
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: ''' , aString
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
GtApLexiconReference >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconReference >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconReference >> referenceString [
	^ ref
]

{ #category : #accessing }
GtApLexiconReference >> referenceString: anObject [
	ref := anObject
]

{ #category : #accessing }
GtApLexiconReference >> type [
	^ self class typeName
]
