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
	^ 'fromRequest: aRequest withClient: aClient
	^ self new
		client: aClient;
		rawData: aRequest'
		, (aDefinition properties ifEmpty: [ '' ] ifNotEmpty: [ ';' ])
		, '
		'
		, ('; 
		'
				join: (aDefinition properties associations
						collect: [ :anAssociation | 
							| aKey aChildDefinition |
							aKey := anAssociation key.
							aChildDefinition := anAssociation value.
							self accessorPrefix , aKey asCamelCase , ': ('
								, (aChildDefinition buildFromRequestWithKey: aKey) , ')' ]))
]

{ #category : #accessing }
GtApDefinitionFromRequestBuilder >> buildUsing: aModel [
	self lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			(aDefinition type = 'object' or: [ aDefinition type = 'record' ])
				ifTrue: [ | skip className traitName |
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					traitName := 'T' , className.
					skip := false.

					className
						asClassIfPresent: [ :aClass | (aClass respondsTo: #fromRequest:) ifTrue: [ skip := true ] ].

					skip
						ifFalse: [ (RBAddMethodRefactoring
								model: aModel
								addMethod: (RBParser
										parseMethod: (self buildFromRequestFor: aDefinition)) formattedCode
								toClass: (aModel classNamed: className asSymbol) classSide
								inProtocols: #('serialization')) primitiveExecute ] ] ]
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
