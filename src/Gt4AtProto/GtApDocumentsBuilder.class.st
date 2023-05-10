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
	(RBAddClassRefactoring
		model: aModel
		addClass: self clientClass
		superclass: #GtApClient
		subclasses: {}
		category: self packageName) primitiveExecute.

	self lexicons documents
		keysAndValuesDo: [ :aKey :aDocument | 
			aDocument xrpcCalls
				keysAndValuesDo: [ :aName :aMethod | 
					(RBAddMethodRefactoring
						model: aModel
						addMethod: (aMethod asXRPCMethodNamed: aKey)
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
