Class {
	#name : #GtApLexiconArray,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'items',
		'minLength',
		'maxLength',
		'description'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconArray class >> typeName [
	^ #array
]

{ #category : #visiting }
GtApLexiconArray >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconArray:  self
]

{ #category : #accessing }
GtApLexiconArray >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconArray >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApLexiconArray >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {' , (self items) asClassName
					, '};
		label: ''' , aString capitalized , ''';
		accessor: #atProto', aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconArray >> isArrayDefinition [
	^ true
]

{ #category : #accessing }
GtApLexiconArray >> items [
	^ items
]

{ #category : #accessing }
GtApLexiconArray >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtApLexiconArray >> maxLength [
	^ maxLength
]

{ #category : #accessing }
GtApLexiconArray >> maxLength: anObject [
	maxLength := anObject
]

{ #category : #accessing }
GtApLexiconArray >> minLength [
	^ minLength
]

{ #category : #accessing }
GtApLexiconArray >> minLength: anObject [
	minLength := anObject
]

{ #category : #accessing }
GtApLexiconArray >> referencedDefinitions [
	^ self items isCollection 
		ifTrue: [ self items] 
		ifFalse: [ {self items} ]
]

{ #category : #accessing }
GtApLexiconArray >> resolvedReferencedDefinitions [
	^ self referencedDefinitions flatCollect: [ :aDefinition |
		aDefinition resolvedReferencedDefinitions ]
]

{ #category : #accessing }
GtApLexiconArray >> typeDescription [
	^ super typeDescription, ' of ', self items typeDescription
]
