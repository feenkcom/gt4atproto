Class {
	#name : #GtApLexiconDefinition,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #testing }
GtApLexiconDefinition class >> needsCustomAttributeMappings [
	^ false
]

{ #category : #visiting }
GtApLexiconDefinition >> acceptVisitor: aLexiconVisitor [
	self subclassResponsibility
]

{ #category : #printing }
GtApLexiconDefinition >> descriptionOn: aStream [ 
]

{ #category : #traversing }
GtApLexiconDefinition >> directlyReferencedDefinitionsDo: aBlock [
	self referencedDefinitions do: [ :aDefinition |
		aBlock cull: aDefinition ]
]

{ #category : #accessing }
GtApLexiconDefinition >> generateGetterAs: aString [
	^ aString
		, '
	^ ', aString
]

{ #category : #accessing }
GtApLexiconDefinition >> generateSetterAs: aString [
	^ aString
		, ': anObject
	', aString, ' := anObject'
]

{ #category : #'gt - extensions' }
GtApLexiconDefinition >> gtJsonObjectFor: aView context: aContext [
	<gtView>
	
	^ aView forward 
		title: 'Raw Data';
		priority: 40;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonObjectFor:context:
]

{ #category : #'gt - extensions' }
GtApLexiconDefinition >> gtJsonStringFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'JSON String';
		priority: 50;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonStringFor:
]

{ #category : #testing }
GtApLexiconDefinition >> isArrayDefinition [
	^ false
]

{ #category : #testing }
GtApLexiconDefinition >> isObjectDefinition [
	^ false
]

{ #category : #testing }
GtApLexiconDefinition >> isReference [
	^ false
]

{ #category : #testing }
GtApLexiconDefinition >> isUnionDefinition [
	^ false
]

{ #category : #testing }
GtApLexiconDefinition >> isXRPCCall [
	^ false
]

{ #category : #printing }
GtApLexiconDefinition >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		self descriptionOn: aStream ]
]

{ #category : #accessing }
GtApLexiconDefinition >> rawData [
	^ rawData
]

{ #category : #accessing }
GtApLexiconDefinition >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtApLexiconDefinition >> referencedDefinitions [
	^ #()
]

{ #category : #accessing }
GtApLexiconDefinition >> resolvedReferencedDefinitions [
	^ self referencedDefinitions flatCollect: [ :each |
		(each isReference or: [each isUnionDefinition] )
			ifTrue: [ each resolvedDefinitions ]
			ifFalse: [ each isArrayDefinition 
				ifTrue: [ each resolvedReferencedDefinitions  ]
				ifFalse: [ {each}  ] ] ]
]

{ #category : #accessing }
GtApLexiconDefinition >> type [
	^ self class typeName
]

{ #category : #accessing }
GtApLexiconDefinition >> typeDescription [
	^ self type
]

{ #category : #traversing }
GtApLexiconDefinition >> withAllReferencedDefinitionsDo: aBlock [
	^ self 
		withDeep: [ :aDefinition | aDefinition referencedDefinitions ] 
		do: aBlock
]

{ #category : #traversing }
GtApLexiconDefinition >> withDirectlyReferencedDefinitionsDo: aBlock [
	aBlock cull: self.
	self directlyReferencedDefinitionsDo: aBlock.
]
