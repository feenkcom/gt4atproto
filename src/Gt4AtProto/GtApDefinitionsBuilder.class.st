Class {
	#name : #GtApDefinitionsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'packageName'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionsBuilder >> buildUsing: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.

					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: Object
						subclasses: #()
						category: self packageName) primitiveExecute.

					traitName
						asClassIfPresent: [ GtRBAddTraitUsageRefactoring traitName: traitName class: className ] ] ]
]

{ #category : #accessing }
GtApDefinitionsBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApDefinitionsBuilder >> initialize [
	packageName := self defaultPackageName
]

{ #category : #accessing }
GtApDefinitionsBuilder >> packageName [
	^ packageName
]

{ #category : #accessing }
GtApDefinitionsBuilder >> packageName: anObject [
	packageName := anObject
]
