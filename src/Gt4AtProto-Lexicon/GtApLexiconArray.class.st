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
GtApLexiconArray >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey
		, ''' ifPresent: [:anArray | anArray collect: [:aValue |'
		, (self items buildFromRequestOn: 'aValue'), ' ] ] ifAbsent: [ nil ]'
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
GtApLexiconArray >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {' , (self items) asClassNames
					, '};
		label: ''' , aString capitalized , ''';
		accessor: #', aPrefix, aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconArray >> generateJson [
	^ {'type' -> 'array'.
		'items' -> self items generateJson} asDictionary
]

{ #category : #accessing }
GtApLexiconArray >> gtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Items';
		priority: 1;
		object: [ GtApLexiconDefinitionsGroup
				withAll: (self referencedDefinitions collect: #targetDefinition) ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtApLexiconArray >> gtViewPropertiesFor: aView [
	<gtView>
	^ self gtItemsFor: aView
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

{ #category : #accessing }
GtApLexiconArray >> typePragma [
	^ '<atpType:' , self referencedDefinitions first embeddedPragmaType , ' format:nil>
	<atpCollection>'
]
