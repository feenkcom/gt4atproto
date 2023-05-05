Class {
	#name : #GtApLexiconXrpcProcedure,
	#superclass : #GtApLexiconXrpcRequest,
	#instVars : [
		'input'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconXrpcProcedure class >> typeName [
	^ #procedure
]

{ #category : #accessing }
GtApLexiconXrpcProcedure >> asXRPCMethodNamed: aName [
	| methodName |
	methodName := (aName replaceAllRegex: '[.#]' with: ' ') asCamelCase
			uncapitalized.

	self schema properties
		keysDo: [ :anInputName | methodName := methodName , anInputName , ': ' , anInputName , ' ' ].

	^ methodName
		, '
	^ self procedureOn: ''' , aName , ''' withBody: {'
		, ('. ' join: self xrpcRequestBodyAssociations) , '} asDictionary'
]

{ #category : #accessing }
GtApLexiconXrpcProcedure >> schema [
	^ input
		ifNil: [ GtApLexiconObject empty ]
		ifNotNil: [ (input at: 'schema') ifNil: [ GtApLexiconObject empty ] ]
]

{ #category : #accessing }
GtApLexiconXrpcProcedure >> xrpcRequestBodyAssociations [
	^ self schema properties keys
		collect: [ :anInputName | '''' , anInputName , ''' -> ' , anInputName ]
]
