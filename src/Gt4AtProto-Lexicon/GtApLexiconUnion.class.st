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

{ #category : #testing }
GtApLexiconUnion >> isReference [
	^ true
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
GtApLexiconUnion >> typeDescription [
	^ String streamContents: [:s | 
		s << 'union('.
		self refs asStringOn: s delimiter: '|'.
		s << ')']
]
