Class {
	#name : #GtApLexiconXrpcRequest,
	#superclass : #GtApLexiconXrpcEntity,
	#instVars : [
		'parameters',
		'output',
		'errors'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #mappings }
GtApLexiconXrpcRequest class >> customAttributeMappings [
	^ {
		#output -> [ :anImporter :aSchemaData |
			anImporter 
				createSchemaOfType: GtApLexiconXrpcBody fromData: aSchemaData ] }
]

{ #category : #testing }
GtApLexiconXrpcRequest class >> needsCustomAttributeMappings [
	^ true
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> asClassName [
	^ ((self id replaceAllRegex: '#main' with: '')
		replaceAllRegex: '[.#]'
		with: ' ') asCamelCase , 'Client'
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> errors [
	^ errors
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> errors: anObject [
	errors := anObject
]

{ #category : #'gt - extensions' }
GtApLexiconXrpcRequest >> gtViewOutputPropertiesFor: aView [
	<gtView>
	
	output ifNil: [ ^ aView empty ].
	
	^ aView forward 
		title: 'Output';
		priority: 15;
		object: [ output ];
		view: #gtViewSchemaPropertiesFor:  
]

{ #category : #'gt - extensions' }
GtApLexiconXrpcRequest >> gtViewParametersFor: aView [

	<gtView>
	self parameters ifNil: [ ^ aView empty  ].
	
	^ aView forward
		title: 'Parameters';
		priority: 10;
		object: [ self parameters ];
		view: #gtViewPropertiesFor:
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> isXRPCCall [
	^ true
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> methodName: aName [
	^ ((aName replaceAllRegex: '#main' with: '') replaceAllRegex: '[.#]' with: ' ')
		asCamelCase uncapitalized
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> output [
	^ output ifNil: [ GtApLexiconObject empty ]
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> output: anObject [
	output := anObject
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> parameters [
	^ parameters ifNil: [ GtApLexiconObject empty ]
]

{ #category : #accessing }
GtApLexiconXrpcRequest >> parameters: anObject [
	parameters := anObject
]
