Class {
	#name : #GtApLexiconXrpcProcedure,
	#superclass : #GtApLexiconXrpcRequest,
	#instVars : [
		'input'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #mappings }
GtApLexiconXrpcProcedure class >> customAttributeMappings [
	^ super customAttributeMappings, {
		#input -> [ :anImporter :aSchemaData |
			anImporter 
				createSchemaOfType: GtApLexiconXrpcBody fromData: aSchemaData ] }
]

{ #category : #accessing }
GtApLexiconXrpcProcedure class >> typeName [
	^ #procedure
]

{ #category : #visiting }
GtApLexiconXrpcProcedure >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconXrpcProcedure: self
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

{ #category : #'gt - extensions' }
GtApLexiconXrpcProcedure >> gtViewInputPropertiesFor: aView [
	<gtView>
	
	input ifNil: [ ^ aView empty ].
	
	^ aView forward 
		title: 'Input';
		priority: 10;
		object: [ input ];
		view: #gtViewSchemaPropertiesFor:  
]

{ #category : #accessing }
GtApLexiconXrpcProcedure >> input [
	^ input
]

{ #category : #accessing }
GtApLexiconXrpcProcedure >> input: anObject [
	input := anObject
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
