Class {
	#name : #GtApLexiconDefinition,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'id',
		'documentsDirectory',
		'documentFile'
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

{ #category : #accessing }
GtApLexiconDefinition >> asClassName [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApLexiconDefinition >> asClassNames [
	^ self asClassName
]

{ #category : #accessing }
GtApLexiconDefinition >> buildFromRequestWithKey: aKey [
	^ self subclassResponsibility
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
GtApLexiconDefinition >> documentFile [
	^ documentFile
]

{ #category : #accessing }
GtApLexiconDefinition >> documentFile: anObject [
	documentFile := anObject
]

{ #category : #accessing }
GtApLexiconDefinition >> documentsDirectory [
	^ documentsDirectory
]

{ #category : #accessing }
GtApLexiconDefinition >> documentsDirectory: anObject [
	documentsDirectory := anObject
]

{ #category : #accessing }
GtApLexiconDefinition >> generateDeserialization [
	^ ''
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
		title: 'Raw data';
		priority: 40;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonObjectFor:context:
]

{ #category : #'gt - extensions' }
GtApLexiconDefinition >> gtJsonStringFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'JSON string';
		priority: 50;
		object: [ GtJson forJsonObject: rawData];
		view: #gtJsonStringFor:
]

{ #category : #accessing }
GtApLexiconDefinition >> hasId [
	^ id isNotNil
]

{ #category : #accessing }
GtApLexiconDefinition >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconDefinition >> id: anId [
	id := anId
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
	<todo: 'Replace with a dedicated object'>
	^ self referencedDefinitions flatCollect: [ :each |
		(each isReference or: [each isUnionDefinition] )
			ifTrue: [ each resolvedDefinitions ]
			ifFalse: [ each isArrayDefinition 
				ifTrue: [ each resolvedReferencedDefinitions  ]
				ifFalse: [ {each}  ] ] ]
]

{ #category : #accessing }
GtApLexiconDefinition >> targetDefinition [
	^ self
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
