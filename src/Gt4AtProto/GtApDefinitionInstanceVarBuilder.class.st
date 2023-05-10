Class {
	#name : #GtApDefinitionInstanceVarBuilder,
	#superclass : #GtApDefinitionPropertyBuilder,
	#instVars : [
		'instanceVarPrefix'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionInstanceVarBuilder >> buildPropertyInClass: className forObject: anApObject inModel: aModel usingPropertyKey: aPropertyKey andProperty: aProperty [
	| key |
	key := self instanceVarPrefix , aPropertyKey asCamelCase.
	(RBAddInstanceVariableRefactoring
		model: aModel
		variable: key
		class: className) primitiveExecute
]

{ #category : #accessing }
GtApDefinitionInstanceVarBuilder >> defaultInstanceVarPrefix [
	^ 'atProto'
]

{ #category : #accessing }
GtApDefinitionInstanceVarBuilder >> initialize [
	instanceVarPrefix := self defaultInstanceVarPrefix
]

{ #category : #accessing }
GtApDefinitionInstanceVarBuilder >> instanceVarPrefix [
	^ instanceVarPrefix
]

{ #category : #accessing }
GtApDefinitionInstanceVarBuilder >> instanceVarPrefix: anObject [
	instanceVarPrefix := anObject
]
