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

{ #category : #visiting }
GtApLexiconDefinitionReference >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconDefinitionReference:  self
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

{ #category : #testing }
GtApLexiconDefinitionReference >> isObjectDefinition [
	^ false
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> isReference [
	^ true
]

{ #category : #testing }
GtApLexiconDefinitionReference >> isUnionDefinition [
	^ false
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

{ #category : #traversing }
GtApLexiconDefinitionReference >> referencedDefinitions [
	^ self referencedDefinition 
		ifNil: [ #() ] 
		ifNotNil: [ :aDefinition |
			{aDefinition} ]
]

{ #category : #'reference resolving' }
GtApLexiconDefinitionReference >> resolveContainedReferenceUsing: aBlock [
	self referencedDefinition: (aBlock value: self referenceString)
]

{ #category : #traversing }
GtApLexiconDefinitionReference >> resolvedDefinitions [
	^ self referencedDefinition 
		ifNil: [ #() ] 
		ifNotNil: [ :aDefinition |
			{aDefinition} ]
]

{ #category : #traversing }
GtApLexiconDefinitionReference >> resolvedReferencedDefinitions [
	^ self resolvedDefinitions
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

{ #category : #traversing }
GtApLexiconDefinitionReference >> withAllReferencedDefinitionsDo: aBlock [
	aBlock cull: self.
	self referencedDefinition ifNotNil: [ :aDefinition |
		aDefinition withAllReferencedDefinitionsDo: aBlock ]
]
