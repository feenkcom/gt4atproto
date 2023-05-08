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
	^ '. '
		join: (self refs
				collect: [ :aClassName | (aClassName replaceAllRegex: '[.#]' with: ' ') asCamelCase ])
]

{ #category : #accessing }
GtApLexiconUnion >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconUnion >> generateDescriptorFor: aString isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {' , ('. ' join: (self refs collect: [ :aRef | '''' , aRef , '''' ]))
			, '};
		label: ''' , aString capitalized
			, ''';
		accessor: #atProto' , aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
		beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconUnion >> gtViewResolvedDefinitionsFor: aView [ 
	<gtView>
	resolvedDefinitions  ifNil: [ ^ aView empty ].
	
	^ aView columnedList 
		title: 'References';
		priority: 10;
		items: [ resolvedDefinitions ];
		column: 'Id' text: [ :aDefinition |
			aDefinition id ];
		column: 'Type' text: [ :aDefinition |
			aDefinition type ]
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
