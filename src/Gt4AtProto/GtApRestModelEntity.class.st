Class {
	#name : #GtApRestModelEntity,
	#superclass : #GtApRestModel,
	#instVars : [
		'entity'
	],
	#category : #'Gt4AtProto-RestCall - Model'
}

{ #category : #accessing }
GtApRestModelEntity class >> forEntity: anEntity [
	^ self new entity: anEntity
]

{ #category : #accessing }
GtApRestModelEntity >> asClassName [
	^ self entity name
]

{ #category : #accessing }
GtApRestModelEntity >> asLexiconOutputIn: aGenerator [
	^ GtApLexiconDefinitionReference new
		referenceString: aGenerator id , '.' , entity name asLowercase;
		referencedDefinition: (aGenerator generateData: entity) asObject
]

{ #category : #accessing }
GtApRestModelEntity >> entity [
	^ entity
]

{ #category : #accessing }
GtApRestModelEntity >> entity: anObject [
	entity := anObject
]
