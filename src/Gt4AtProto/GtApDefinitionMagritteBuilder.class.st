Class {
	#name : #GtApDefinitionMagritteBuilder,
	#superclass : #GtApDefinitionPropertyBuilder,
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionMagritteBuilder >> buildPropertyInClass: className forObject: anApObject inModel: aModel usingPropertyKey: aPropertyKey andProperty: aProperty [
	(RBAddMethodRefactoring
		model: aModel
		addMethod: (aProperty
				generateDescriptorFor: aPropertyKey
				isRequired: (anApObject isPropertyRequired: aPropertyKey))
		toClass: className
		inProtocols: #magritte) primitiveExecute
]
