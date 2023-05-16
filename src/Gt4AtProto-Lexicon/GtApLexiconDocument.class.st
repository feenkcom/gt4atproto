Class {
	#name : #GtApLexiconDocument,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'lexicon',
		'id',
		'revision',
		'description',
		'definitions',
		'documentFile',
		'documentsDirectory'
	],
	#category : #'Gt4AtProto-Lexicon-Documents'
}

{ #category : #accessing }
GtApLexiconDocument >> definitionWithName: anId [
	^ definitions at: anId
]

{ #category : #accessing }
GtApLexiconDocument >> definitions [
	^ definitions
]

{ #category : #accessing }
GtApLexiconDocument >> definitions: anObject [
	definitions := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconDocument >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> documentFile [
	^ documentFile
]

{ #category : #accessing }
GtApLexiconDocument >> documentFile: anObject [
	documentFile := anObject.
	self definitions do: [ :aDefinition | aDefinition documentFile: anObject ]
]

{ #category : #accessing }
GtApLexiconDocument >> documentsDirectory: anObject [
	documentsDirectory := anObject.
	self definitions do: [ :aDefinition | aDefinition documentsDirectory: anObject ]
]

{ #category : #'gt - extensions' }
GtApLexiconDocument >> gtViewDefinitionsFor: aView [
	<gtView>
	
	^ aView columnedList
		priority: 1;
		title: 'Definitions';
		items: [ self definitions associations ];
		column: 'Name' text: [ :assoc | assoc key ];
		column: 'Type' text: [ :assoc | assoc value type ];
		column: 'Description' text: [ :assoc | assoc value description ifNil: [''] ];
		send: #value
]

{ #category : #'gt - extensions' }
GtApLexiconDocument >> gtViewDocumentFileFor: aView [
	<gtView>
	
	^ aView forward
		priority: 2;
		title: 'Document file';
		object: [ documentFile ];
		view: #gtJsonFor:
]

{ #category : #testing }
GtApLexiconDocument >> hasMainDefinition [
	^ definitions includesKey: #main
]

{ #category : #accessing }
GtApLexiconDocument >> hasXRPCCalls [
	^ self xrpcCalls isNotEmpty
]

{ #category : #accessing }
GtApLexiconDocument >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconDocument >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> lexicon [
	^ lexicon
]

{ #category : #accessing }
GtApLexiconDocument >> lexicon: anObject [
	lexicon := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> mainDefinition [
	^ definitions at: #main
]

{ #category : #accessing }
GtApLexiconDocument >> mainType [
	^ self hasMainDefinition 
		ifFalse: [ 'No Main' ] 
		ifTrue: [ (self mainDefinition) type ]
]

{ #category : #printing }
GtApLexiconDocument >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		aStream << self id ]
]

{ #category : #accessing }
GtApLexiconDocument >> revision [
	^ revision
]

{ #category : #accessing }
GtApLexiconDocument >> revision: anObject [
	revision := anObject
]

{ #category : #accessing }
GtApLexiconDocument >> xrpcCalls [
	^ self definitions select: #isXRPCCall
]
