Class {
	#name : #GtApDefinitionFromRequestBuilder,
	#superclass : #GtApBuilder,
	#instVars : [
		'accessorPrefix'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> accessorPrefix [
	^ accessorPrefix
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> accessorPrefix: anObject [
	accessorPrefix := anObject
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> buildFromRequestFor: aDefinition [
	^ 'fromRequest: aRequest
	^ self new '
		, ('; 
		'
				join: (aDefinition properties associations
						collect: [ :anAssociation | 
							| aKey aChildDefinition |
							aKey := anAssociation key.
							aChildDefinition := anAssociation value.
							self defaultAccessorPrefix , aKey asCamelCase , ': '
								, ((({'ref'.
										'record'} includes: aChildDefinition type)
										or: [ aChildDefinition type = 'object' and: [ aChildDefinition hasId ] ])
										ifTrue: [ '(' , aChildDefinition asClassName , ' fromRequest: (aRequest at: ''' , aKey
												, ''' ifAbsent: [ nil ]))' ]
										ifFalse: [ '(aRequest at: ''' , aKey , ''' ifAbsent: [ nil ])' ]) ]))
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> buildUsing: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			(aDefinition type = 'object' or: [ aDefinition type = 'record' ])
				ifTrue: [ | className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.
					(RBAddMethodRefactoring
						model: aModel
						addMethod: (self buildFromRequestFor: aDefinition)
						toClass: (aModel classNamed: className asSymbol) classSide
						inProtocols: #('serialization')) primitiveExecute ] ]
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> defaultAccessorPrefix [
	^ 'atProto'
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> initialize [
	accessorPrefix := self defaultAccessorPrefix
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> removeUsing: aModel [
	"noop"
]
