Class {
	#name : #GtApDefinitionAccessorBuilder,
	#superclass : #GtApDefinitionPropertyBuilder,
	#instVars : [
		'accessorPrefix'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionAccessorBuilder >> accessorPrefix [
	^ accessorPrefix
]

{ #category : #accessing }
GtApDefinitionAccessorBuilder >> accessorPrefix: anObject [
	accessorPrefix := anObject
]

{ #category : #accessing }
GtApDefinitionAccessorBuilder >> buildPropertyInClass: className forObject: anApObject inModel: aModel usingPropertyKey: aPropertyKey andProperty: aProperty [
	| key |
	key := self accessorPrefix , aPropertyKey asCamelCase.

	className
		asClassIfPresent: [ :aClass | (aClass canUnderstand: key) ifTrue: [ ^ self ] ].

	(RBAddMethodRefactoring
		model: aModel
		addMethod: (aProperty generateGetterAs: key)
		toClass: className
		inProtocols: #accessing) primitiveExecute.
	(RBAddMethodRefactoring
		model: aModel
		addMethod: (aProperty generateSetterAs: key)
		toClass: className
		inProtocols: #accessing) primitiveExecute
]

{ #category : #accessing }
GtApDefinitionAccessorBuilder >> defaultAccessorPrefix [
	^ 'atProto'
]

{ #category : #accessing }
GtApDefinitionAccessorBuilder >> initialize [
	accessorPrefix := self defaultAccessorPrefix
]
