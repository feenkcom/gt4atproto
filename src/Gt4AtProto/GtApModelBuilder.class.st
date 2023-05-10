Class {
	#name : #GtApModelBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'clientSuffix',
		'builders',
		'model'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApModelBuilder >> apply [
	self model changes gtExecuteWithNotification
]

{ #category : #accessing }
GtApModelBuilder >> build [
	self buildUsing: self model
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
GtApModelBuilder >> buildUsing: aModel [
	self builders do: [ :aBuilder | aBuilder buildUsing: aModel ]
]

{ #category : #accessing }
GtApModelBuilder >> builders [
	^ builders
]

{ #category : #accessing }
GtApModelBuilder >> builders: anObject [
	builders := anObject
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
GtApModelBuilder >> gtViewModelFor: aView [
	<gtView>
	^ self model gtChangesFor: aView
]

{ #category : #accessing }
GtApModelBuilder >> initialize [
	clientSuffix := self defaultClientSuffix.
	builders := OrderedCollection new.
	model := RBNamespace new
]

{ #category : #accessing }
GtApModelBuilder >> model [
	^ model
]

{ #category : #accessing }
GtApModelBuilder >> model: anObject [
	model := anObject
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

{ #category : #accessing }
GtApModelBuilder >> useDefinitionAccessorBuilder [
	builders add: (GtApDefinitionAccessorBuilder new lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionAccessorBuilderWithPrefix: aPrefix [
	builders
		add: (GtApDefinitionAccessorBuilder new
				accessorPrefix: aPrefix;
				lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionInstanceVarBuilder [
	builders add: (GtApDefinitionInstanceVarBuilder new lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionInstanceVarBuilderWithPrefix: aPrefix [
	builders
		add: (GtApDefinitionInstanceVarBuilder new
				instanceVarPrefix: aPrefix;
				lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionMagritteBuilder [
	builders add: (GtApDefinitionMagritteBuilder new lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionsBuilder [
	builders add: (GtApDefinitionsBuilder new lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDefinitionsBuilderInPackage: aPackageName [
	builders
		add: (GtApDefinitionsBuilder new
				packageName: aPackageName;
				lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDocumentsBuilder [
	builders add: (GtApDocumentsBuilder new lexicons: self lexicons)
]

{ #category : #accessing }
GtApModelBuilder >> useDocumentsBuilderInPackage: aPackageName andClientSuffix: aString [
	builders
		add: (GtApDocumentsBuilder new
				lexicons: self lexicons;
				packageName: aPackageName;
				clientSuffix: aString)
]
