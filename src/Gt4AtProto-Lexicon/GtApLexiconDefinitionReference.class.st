Class {
	#name : #GtApLexiconDefinitionReference,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'referencedDefinition',
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
	^ self referencedDefinition asClassName
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> buildFromRequestOn: aKey [
	^ self asClassName , ' fromRequest: ' , aKey, ' withClient: aClient'
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> buildFromRequestWithKey: aKey [
	self referencedDefinition isPrimitive
		ifTrue: [ ^ self referencedDefinition buildFromRequestWithKey: aKey ].

	^ 'aRequest at: ''' , aKey , ''' ifPresent: [:aValue | ' , self asClassName
		, ' fromRequest: aValue withClient: aClient ] ifAbsent: [ nil ]'
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> description [
	^ nil
]

{ #category : #printing }
GtApLexiconDefinitionReference >> descriptionOn: aStream [
	aStream << self referenceString
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	^ aString
		, 'Description
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: ''' , aString capitalized
		, ''';
		accessor: #' , aPrefix , aString asCamelCase
		, (aBoolean
				ifTrue: [ ';
		beRequired' ]
				ifFalse: [ '' ])
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateDeserializationFor: aValue [
	^ self referencedDefinition generateDeserializationFor: aValue
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateGetterAs: aString [
	^ aString
		, '
	<referenceTo:''' , self referenceString
		, '''>
	' , self typePragma
		, '
	^ ' , aString
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateJson [
	^ {'type' -> 'ref'.
		'ref' -> self referenceString} asDictionary
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> generateSetterAs: aString [
	^ aString asMutator
		, ' anObject
	<referenceTo:''' , self referenceString
		, '''>
	', aString, ' := anObject'
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> hasId [
	^ self referencedDefinition hasId
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> isReference [
	^ true
]

{ #category : #'as yet unclassified' }
GtApLexiconDefinitionReference >> properties [
	^ self referencedDefinition properties
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
GtApLexiconDefinitionReference >> targetDefinition [
	^ self referencedDefinition ifNotNil: [ :aDefinition |
		aDefinition targetDefinition ]
]

{ #category : #accessing }
GtApLexiconDefinitionReference >> typeDescription [
	^ self referencedDefinition
		ifNil: [ 'ref(', self referenceString, ')' ]
		ifNotNil: [ :aDefinition | aDefinition typeDescription ]
]
