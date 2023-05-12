Class {
	#name : #GtApDefinitionsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'packageName',
		'modelSuperClass'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionsBuilder >> buildUsing: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			(aDefinition type = 'object' or: [ aDefinition type = 'record' ])
				ifTrue: [ | className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.
					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: self modelSuperClass
						subclasses: #()
						category: self packageName) primitiveExecute.

					(GtRBSilentlyAddMethodRefactoring
						model: aModel
						addMethod: 'atpRecordName
 ^ ''' , (aKey removeSuffix: '#main') , ''''
						toClass: (aModel classNamed: className asSymbol) classSide
						inProtocols: {'accessing'}) primitiveExecute.

					traitName
						asClassIfPresent: [ ((GtRBAddTraitUsageToClassByNameRefactoring
								traitName: traitName
								inClassNamed: className asSymbol) model: aModel) primitiveExecute ] ] ]
]

{ #category : #accessing }
GtApDefinitionsBuilder >> defaultModelSuperClass [
	^ GtApModelEntity
]

{ #category : #accessing }
GtApDefinitionsBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApDefinitionsBuilder >> initialize [
	packageName := self defaultPackageName.
	modelSuperClass := self defaultModelSuperClass
]

{ #category : #accessing }
GtApDefinitionsBuilder >> modelSuperClass [
	^ modelSuperClass
]

{ #category : #accessing }
GtApDefinitionsBuilder >> modelSuperClass: anObject [
	modelSuperClass := anObject
]

{ #category : #accessing }
GtApDefinitionsBuilder >> packageName [
	^ packageName
]

{ #category : #accessing }
GtApDefinitionsBuilder >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
GtApDefinitionsBuilder >> removeUsing: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			(aDefinition type = 'object' or: [ aDefinition type = 'record' ])
				ifTrue: [ | className |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					className
						asClassIfPresent: [ (GtRBRemoveClassRefactoring model: aModel classNames: {className asSymbol})
								primitiveExecute ] ] ]
]
