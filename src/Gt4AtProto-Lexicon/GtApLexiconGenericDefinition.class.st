Class {
	#name : #GtApLexiconGenericDefinition,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'type',
		'attributes',
		'id'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconGenericDefinition >> asClassName [
	self type = 'union'
		ifTrue: [ ^ '. '
				join: ((self attributes at: #refs)
						collect: [ :aClassName | (aClassName replaceAllRegex: '[.#]' with: ' ') asCamelCase ]) ].

	self type = 'string' ifTrue: [ ^ 'String' ].
	self type = 'cid-link' ifTrue: [ ^ 'String' ].
	self type = 'integer' ifTrue: [ ^ 'Number' ].
	self type = 'unknown' ifTrue: [ ^ 'Object' ].
	
	self error: 'Unknown type to class conversion'
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> asObject [
	^ GtApLexiconObject from: self
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> attributes [
	^ attributes
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> description [
	^ self attributes 
		at: #description
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ '.
	self type = 'union'
		ifTrue: [ source := source
					, 'MASingleOptionDescription new
		options: {'
					, ('. '
							join: ((self attributes at: #refs) collect: [ :aRef | '''' , aRef , '''' ]))
					, '};' ].

	self type = 'array'
		ifTrue: [ source := source
					, 'MAToManyRelationDescription new
		classes: {' , (self attributes at: #items) asClassName
					, '};' ].

	self type = 'object'
		ifTrue: [ source := source
					, 'MAToOneRelationDescription new
				classes: {Object};' ].

	({'bytes' . 'blob'} includes: self type) ifTrue: [ source := source , 'MAFileDescription new' ].
	
	self type = 'boolean' ifTrue: [ source := source , 'MABooleanDescription new' ].
	
	self type = 'integer' ifTrue: [ source := source , 'MANumberDescription new' ].

	({'string' . 'unknown' . 'cid-link'} includes: self type)
		ifTrue: [ source := source , 'MAStringDescription new' ].

	source := source
			, '
		label: ''' , aString capitalized , ''';
		accessor: #atProto', aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> generateGetterAs: aString [
	^ aString
		, '
	<objectWithProps:''' , (', ' join: self attributes keys)
		, '''>
	^ ', aString
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> generateSetterAs: aString [
	^ aString
		, ': anObject
	<objectWithProps:''' , (', ' join: self attributes keys)
		, '''>
	', aString, ' := anObject'
]

{ #category : #'gt - extensions' }
GtApLexiconGenericDefinition >> gtViewAttributesFor: aView [
	<gtView>
	^ aView forward 
		title: 'Attributes';
		priority: 20;
		object: [ self attributes];
		view: #gtItemsFor: 
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> keysAndValuesDo: aBlock [
	^ self attributes keysAndValuesDo: aBlock
]

{ #category : #printing }
GtApLexiconGenericDefinition >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self type]
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> type [
	^ type
]

{ #category : #accessing }
GtApLexiconGenericDefinition >> type: anObject [
	type := anObject
]
