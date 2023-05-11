Class {
	#name : #GtApDefinitionMagritteBuilder,
	#superclass : #GtApDefinitionPropertyBuilder,
	#instVars : [
		'accessorPrefix'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionMagritteBuilder >> accessorPrefix [
	^ accessorPrefix ifNil: [ accessorPrefix := self defaultAccessorPrefix ]
]

{ #category : #accessing }
GtApDefinitionMagritteBuilder >> accessorPrefix: anObject [
	accessorPrefix := anObject
]

{ #category : #accessing }
GtApDefinitionMagritteBuilder >> buildPropertyInClass: className forObject: anApObject inModel: aModel usingPropertyKey: aPropertyKey andProperty: aProperty [
	(RBAddMethodRefactoring
		model: aModel
		addMethod: (aProperty
				generateDescriptorFor: aPropertyKey
				usingPrefix: self accessorPrefix
				isRequired: (anApObject isPropertyRequired: aPropertyKey))
		toClass: className
		inProtocols: #magritte) primitiveExecute
]

{ #category : #accessing }
GtApDefinitionMagritteBuilder >> defaultAccessorPrefix [
	^ #atProto
]
