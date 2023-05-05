Class {
	#name : #GtApLexiconDefinitionReference,
	#superclass : #Object,
	#instVars : [
		'referencedDefinition',
		'rawData',
		'ref'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconDefinitionReference class >> typeName [
	^ #ref
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> asClassName [
	^ (self referenceString replaceAllRegex: '[.#]' with: ' ') asCamelCase
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateDescriptorFor: aString isRequired: aBoolean [
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
GtApLexiconDefinitionReference >> generateGetterAs: aString [
	^ aString
		, '
	<referenceTo:''' , self referenceString
		, '''>
	^ ', aString
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateSetterAs: aString [
	^ aString
		, ': anObject
	<referenceTo:''' , self referenceString
		, '''>
	', aString, ' := anObject'
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> isReference [
	^ true
]

{ #category : #printing }
GtApLexiconDefinitionReference >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self referenceString]
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> referenceString [
	^ ref
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> referenceString: anObject [
	ref := anObject
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> referencedDefinition [
	^ referencedDefinition
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> referencedDefinition: anObject [
	referencedDefinition := anObject
]

{ #category : #'reference resolving' }
GtApLexiconDefinitionReference >> resolveContainedReferenceUsing: aBlock [
	self referencedDefinition: (aBlock value: self referenceString)
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> type [
	^ self class typeName
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> typeDescription [
	^ self referencedDefinition
		ifNil: [ 'ref(', self referenceString, ')' ]
		ifNotNil: [ :aDefinition | aDefinition typeDescription ]
]
