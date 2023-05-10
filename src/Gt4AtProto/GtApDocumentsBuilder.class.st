Class {
	#name : #GtApDocumentsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'clientSuffix',
		'packageName'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDocumentsBuilder >> buildUsing: aModel [
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
GtApDocumentsBuilder >> clientSuffix [
	^ clientSuffix
]

{ #category : #accessing }
GtApDocumentsBuilder >> clientSuffix: anObject [
	clientSuffix := anObject
]

{ #category : #accessing }
GtApDocumentsBuilder >> defaultClientSuffix [
	^ 'Client'
]

{ #category : #accessing }
GtApDocumentsBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApDocumentsBuilder >> initialize [
	clientSuffix := self defaultClientSuffix.
	packageName := self defaultPackageName
]

{ #category : #accessing }
GtApDocumentsBuilder >> packageName [
	^ packageName
]

{ #category : #accessing }
GtApDocumentsBuilder >> packageName: anObject [
	packageName := anObject
]
