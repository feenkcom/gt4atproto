Class {
	#name : #GtApDocumentsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'packageName',
		'clientClass'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDocumentsBuilder >> buildUsing: aModel [
	| traitName |
	self clientClass asClassIfPresent: [ ^ self ].

	traitName := 'T' , self clientClass.

	(RBAddClassRefactoring
		model: aModel
		addClass: self clientClass
		superclass: #GtApClient
		subclasses: {}
		category: self packageName) primitiveExecute.

	traitName
		asClassIfPresent: [ ((GtRBAddTraitUsageToClassByNameRefactoring
				traitName: traitName
				inClassNamed: self clientClass asSymbol) model: aModel) primitiveExecute ].

	self lexicons documents
		keysAndValuesDo: [ :aKey :aDocument | 
			aDocument xrpcCalls
				keysAndValuesDo: [ :aName :aMethod | 
					(RBAddMethodRefactoring
						model: aModel
						addMethod: (RBParser parseMethod: (aMethod asXRPCMethodNamed: aKey))
								formattedCode
						toClass: self clientClass
						inProtocols: {#* , self packageName}) primitiveExecute ] ]
]

{ #category : #accessing }
GtApDocumentsBuilder >> clientClass [
	^ clientClass
]

{ #category : #accessing }
GtApDocumentsBuilder >> clientClass: anObject [
	clientClass := anObject
]

{ #category : #accessing }
GtApDocumentsBuilder >> defaultClientClass [
	^ #GtApGeneratedClient
]

{ #category : #accessing }
GtApDocumentsBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApDocumentsBuilder >> initialize [
	packageName := self defaultPackageName.
	clientClass := self defaultClientClass
]

{ #category : #accessing }
GtApDocumentsBuilder >> packageName [
	^ packageName
]

{ #category : #accessing }
GtApDocumentsBuilder >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
GtApDocumentsBuilder >> removeUsing: aModel [
	self clientClass
		asClassIfPresent: [ (GtRBRemoveClassRefactoring model: aModel classNames: {self clientClass})
				primitiveExecute ]
]
