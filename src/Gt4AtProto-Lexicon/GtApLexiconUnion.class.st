Class {
	#name : #GtApLexiconUnion,
	#superclass : #GtApLexiconDefinition,
	#instVars : [
		'refs',
		'resolvedDefinitions'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconUnion class >> typeName [
	^ #union
]

{ #category : #visiting }
GtApLexiconUnion >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconUnion:  self
]

{ #category : #accessing }
GtApLexiconUnion >> asClassName [
	^ self shouldNotImplement
]

{ #category : #accessing }
GtApLexiconUnion >> asClassNames [
	^ String space join: (self referencedDefinitions collect: #asClassNames)
]

{ #category : #accessing }
GtApLexiconUnion >> buildFromRequestOn: aName [
	^ '({'
		, ('. '
				join: (self referencedDefinitions
						collect: [ :anObject | '''' , (anObject id removeSuffix: '#main') , ''' -> ' , anObject asClassName ]))
		, '} asDictionary at: (' , aName , ' at: ''$type'')) fromRequest: ' , aName, ' withClient: aClient'
]

{ #category : #accessing }
GtApLexiconUnion >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey , ''' ifPresent: [:aValue | ({'
		, ('. '
				join: (self referencedDefinitions
						collect: [ :anObject | '''' , (anObject id removeSuffix: '#main') , ''' -> ' , anObject asClassName ]))
		, '} asDictionary at: (aValue at: ''$type'') ifAbsent: [ GtApUnknownRecord new key: (aValue at: ''$type'')]) fromRequest: aValue withClient: aClient ] ifAbsent: [ nil ]'
]

{ #category : #accessing }
GtApLexiconUnion >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconUnion >> embeddedPragmaType [
	^ '#(', self asClassNames,')'
]

{ #category : #accessing }
GtApLexiconUnion >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {' , ('. ' join: (self refs collect: [ :aRef | '''' , aRef , '''' ]))
			, '};
		label: ''' , aString capitalized
			, ''';
		accessor: #' , aPrefix, aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
		beRequired' ].
	^ source
]

{ #category : #'as yet unclassified' }
GtApLexiconUnion >> generateDeserializationFor: aName [
	^ '({'
		, ('. '
				join: (self referencedDefinitions
						collect: [ :anObject | '''' , (anObject id removeSuffix: '#main') , ''' -> ' , anObject asClassName ]))
		, '} asDictionary at: (' , aName , ' at: ''$type'')) fromRequest: ' , aName, ' withClient: self'
]

{ #category : #accessing }
GtApLexiconUnion >> generateJson [
	^ {'type' -> 'union'.
		'refs' -> self refs asArray} asDictionary
]

{ #category : #accessing }
GtApLexiconUnion >> gtViewResolvedDefinitionsFor: aView [
	<gtView>
	resolvedDefinitions ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Items';
		priority: 1;
		object: [ GtApLexiconDefinitionsGroup withAll: resolvedDefinitions ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtApLexiconUnion >> initialize [
	resolvedDefinitions := OrderedCollection new
]

{ #category : #accessing }
GtApLexiconUnion >> isUnionDefinition [
	^ true
]

{ #category : #accessing }
GtApLexiconUnion >> referencedDefinitions [
	^ self resolvedDefinitions ifNil: [ #() ]
]

{ #category : #accessing }
GtApLexiconUnion >> refs [
	^ refs
]

{ #category : #accessing }
GtApLexiconUnion >> refs: anObject [
	refs := anObject
]

{ #category : #'as yet unclassified' }
GtApLexiconUnion >> resolveContainedReferenceUsing: aBlock [ 
	resolvedDefinitions := self refs collect: [ :aReferenceId |
		aBlock value: aReferenceId]
]

{ #category : #accessing }
GtApLexiconUnion >> resolvedDefinitions [
	^ resolvedDefinitions 
]

{ #category : #accessing }
GtApLexiconUnion >> resolvedReferencedDefinitions [
	^ self resolvedDefinitions
]

{ #category : #accessing }
GtApLexiconUnion >> typeDescription [
	^ String streamContents: [:s | 
		s << 'union('.
		self refs asStringOn: s delimiter: '|'.
		s << ')']
]

{ #category : #accessing }
GtApLexiconUnion >> typePragma [
	^ '<atpType:#(', self asClassNames,') format:nil>'
]
