Class {
	#name : #GtApDefinitionsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'packageName',
		'modelSuperClass',
		'prefix'
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
					className
						asClassIfAbsent: [ (RBAddClassRefactoring
								model: aModel
								addClass: className
								superclass: self modelSuperClass
								subclasses: #()
								category: self packageName) primitiveExecute.

							(GtRBSilentlyAddMethodRefactoring
								model: aModel
								addMethod: self prefix
										, 'RecordName
 ^ ''' , (aKey removeSuffix: '#main') , ''''
								toClass: (aModel classNamed: className asSymbol) classSide
								inProtocols: {'accessing'}) primitiveExecute.

							(GtRBSilentlyAddMethodRefactoring
								model: aModel
								addMethod: self prefix
										, 'Description
 ^  ' , (aDefinition description ifNil: [ '' ]) printString
								toClass: (aModel classNamed: className asSymbol) classSide
								inProtocols: {'accessing'}) primitiveExecute.

							(GtRBSilentlyAddMethodRefactoring
								model: aModel
								addMethod: self prefix
										, 'Schema
 ^ ' , (aDefinition rawData ifNil: [ '' ]) asString printString
								toClass: (aModel classNamed: className asSymbol) classSide
								inProtocols: {'accessing'}) primitiveExecute.

							(GtRBSilentlyAddMethodRefactoring
								model: aModel
								addMethod: self prefix
										, 'File
 ^ '''
										, (aDefinition documentFile
												relativeTo: aDefinition documentsDirectory absolutePath) pathString
										, ''''
								toClass: (aModel classNamed: className asSymbol) classSide
								inProtocols: {'accessing'}) primitiveExecute.

							traitName
								asClassIfPresent: [ ((GtRBAddTraitUsageToClassByNameRefactoring
										traitName: traitName
										inClassNamed: className asSymbol) model: aModel) primitiveExecute ] ] ] ]
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
GtApDefinitionsBuilder >> defaultPrefix [
	^ #atProto
]

{ #category : #accessing }
GtApDefinitionsBuilder >> initialize [
	packageName := self defaultPackageName.
	modelSuperClass := self defaultModelSuperClass.
	prefix := self defaultPrefix
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
GtApDefinitionsBuilder >> prefix [
	^ prefix
]

{ #category : #accessing }
GtApDefinitionsBuilder >> prefix: anObject [
	prefix := anObject
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
