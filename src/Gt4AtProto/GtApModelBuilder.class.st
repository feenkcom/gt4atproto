Class {
	#name : #GtApModelBuilder,
	#superclass : #Object,
	#instVars : [
		'lexicons',
		'packageName',
		'modelClassPrefix',
		'clientSuffix',
		'instanceVarPrefix'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApModelBuilder >> build [
	| model |
	model := RBNamespace new.
	self buildDefinitionObjectsIn: model.
	self buildDocumentObjectsIn: model.
	^ model
]

{ #category : #accessing }
GtApModelBuilder >> buildDefinitionObjectsIn: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className traitName anApObject |
					anApObject := aDefinition asObject.
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.

					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: Object
						subclasses: #()
						category: self packageName) primitiveExecute.

					traitName
						asClassIfPresent: [ GtRBAddTraitUsageRefactoring traitName: traitName class: className ].

					anApObject properties
						keysAndValuesDo: [ :aPropertyKey :aProperty | 
							| key |
							key := self instanceVarPrefix , aPropertyKey asCamelCase.
							(RBAddInstanceVariableRefactoring
								model: aModel
								variable: key
								class: className) primitiveExecute.
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty generateGetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty generateSetterAs: key)
								toClass: className
								inProtocols: #accessing) primitiveExecute.

							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aProperty
										generateDescriptorFor: aPropertyKey
										isRequired: (anApObject isPropertyRequired: aPropertyKey))
								toClass: className
								inProtocols: #magritte) primitiveExecute ] ] ]
]

{ #category : #accessing }
GtApModelBuilder >> buildDocumentObjectsIn: aModel [
	self lexicons documents
		keysAndValuesDo: [ :aKey :aDocument | 
			aDocument hasXRPCCalls
				ifTrue: [ | className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase
							, self clientSuffix.
					traitName := 'X' , className.
					(RBAddClassRefactoring
						model: aModel
						addClass: className
						superclass: GtApClient
						subclasses: #()
						category: self packageName) primitiveExecute.


					traitName
						asClassIfPresent: [ GtRBAddTraitUsageRefactoring traitName: traitName class: className ].

					aDocument xrpcCalls
						keysAndValuesDo: [ :aName :aMethod | 
							(RBAddMethodRefactoring
								model: aModel
								addMethod: (aMethod asXRPCMethodNamed: aKey)
								toClass: className
								inProtocols: {#'atproto-xrpc-call'}) primitiveExecute ] ] ]
]

{ #category : #accessing }
GtApModelBuilder >> clientSuffix [
	^ clientSuffix
]

{ #category : #accessing }
GtApModelBuilder >> clientSuffix: anObject [
	clientSuffix := anObject
]

{ #category : #accessing }
GtApModelBuilder >> defaultClientSuffix [
	^ 'Client'
]

{ #category : #accessing }
GtApModelBuilder >> defaultInstanceVarPrefix [
	^ 'atProto'
]

{ #category : #accessing }
GtApModelBuilder >> defaultModelClassPrefix [
	^ ''
]

{ #category : #accessing }
GtApModelBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApModelBuilder >> initialize [
	packageName := self defaultPackageName.
	modelClassPrefix := self defaultModelClassPrefix.
	clientSuffix := self defaultClientSuffix.
	instanceVarPrefix := self defaultInstanceVarPrefix
]

{ #category : #accessing }
GtApModelBuilder >> instanceVarPrefix [
	^ instanceVarPrefix
]

{ #category : #accessing }
GtApModelBuilder >> instanceVarPrefix: anObject [
	instanceVarPrefix := anObject
]

{ #category : #accessing }
GtApModelBuilder >> lexicons [
	^ lexicons
]

{ #category : #accessing }
GtApModelBuilder >> lexicons: anObject [
	lexicons := anObject
]

{ #category : #accessing }
GtApModelBuilder >> modelClassPrefix [
	^ modelClassPrefix
]

{ #category : #accessing }
GtApModelBuilder >> modelClassPrefix: anObject [
	modelClassPrefix := anObject
]

{ #category : #accessing }
GtApModelBuilder >> packageName [
	^ packageName
]

{ #category : #accessing }
GtApModelBuilder >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
GtApModelBuilder >> remove [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			aDefinition type = 'object'
				ifTrue: [ | className |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					className asClassIfPresent: #removeFromSystem ] ].

	self lexicons documents
		keysAndValuesDo: [ :aKey :aDocument | 
			| className |
			aDocument hasXRPCCalls
				ifTrue: [ className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase
							, self clientSuffix.
					className asClassIfPresent: #removeFromSystem ] ]
]
