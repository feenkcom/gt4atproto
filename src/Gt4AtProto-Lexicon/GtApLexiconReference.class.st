Class {
	#name : #GtApLexiconReference,
	#superclass : #Object,
	#instVars : [
		'referencedDefinition',
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
	^ aString
		, 'Description
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: ''' , aString capitalized
		, ''';
		accessor: #atProto' , aString asCamelCase
		, (aBoolean
				ifTrue: [ ';
		beRequired' ]
				ifFalse: [ '' ])
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

{ #category : #accessing }
GtApLexiconReference >> isReference [
	^ true
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
GtApLexiconReference >> referencedDefinition [
	^ referencedDefinition
]

{ #category : #accessing }
GtApLexiconReference >> referencedDefinition: anObject [
	referencedDefinition := anObject
]

{ #category : #'reference resolving' }
GtApLexiconReference >> resolveContainedReferenceUsing: aBlock [
	self referencedDefinition: (aBlock value: self referenceString)
]

{ #category : #accessing }
GtApLexiconReference >> type [
	^ self class typeName
]

{ #category : #accessing }
GtApLexiconReference >> typeDescription [
	^ self referencedDefinition
		ifNil: [ 'ref(', self referenceString, ')' ]
		ifNotNil: [ :aDefinition | aDefinition typeDescription ]
]
