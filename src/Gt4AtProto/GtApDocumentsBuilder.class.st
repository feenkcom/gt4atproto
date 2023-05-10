Class {
	#name : #GtApDocumentsBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'packageName'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDocumentsBuilder >> buildUsing: aModel [
	self lexicons documents
		keysAndValuesDo: [ :aKey :aDocument | 
			aDocument xrpcCalls
				keysAndValuesDo: [ :aName :aMethod | 
					(RBAddMethodRefactoring
						model: aModel
						addMethod: (aMethod asXRPCMethodNamed: aKey)
						toClass: 'GtApClient'
						inProtocols: {#* , packageName}) primitiveExecute ] ]
]

{ #category : #accessing }
GtApDocumentsBuilder >> defaultPackageName [
	^ #'Gt4AtProto-Generated'
]

{ #category : #accessing }
GtApDocumentsBuilder >> initialize [
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
