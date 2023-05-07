Class {
	#name : #GtApLexiconReferencesCollectorVisitor,
	#superclass : #GtApLexiconDefinitionsBasicStructureVisitor,
	#instVars : [
		'references'
	],
	#category : #'Gt4AtProto-Lexicon-Importer'
}

{ #category : #accessing }
GtApLexiconReferencesCollectorVisitor class >> collectForDefinition: aDefinition [
	^ self new 
		collectForDefinition: aDefinition
]

{ #category : #accessing }
GtApLexiconReferencesCollectorVisitor >> collectForDefinition: aDefinition [
	references := OrderedCollection new.
	self visitDefinition:  aDefinition.
	^ references
]

{ #category : #visiting }
GtApLexiconReferencesCollectorVisitor >> visitLexiconDefinitionReference: aLexiconDefinitionReference [
	references add: aLexiconDefinitionReference
]

{ #category : #visiting }
GtApLexiconReferencesCollectorVisitor >> visitLexiconUnion: aLexiconUnion [ 
	references add: aLexiconUnion
]
