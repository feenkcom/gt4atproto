Class {
	#name : #GtApDefinitionPropertyBuilder,
	#superclass : #GtApBuilder,
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApDefinitionPropertyBuilder >> buildPropertyInClass: className forObject: anApObject inModel: aModel usingPropertyKey: aPropertyKey andProperty: aProperty [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApDefinitionPropertyBuilder >> buildUsing: aModel [
	lexicons definitions
		keysAndValuesDo: [ :aKey :aDefinition | 
			(aDefinition type = 'object' or: [ aDefinition type = 'record' ])
				ifTrue: [ | className anApObject |
					anApObject := aDefinition asObject.
					className := (aKey replaceAllRegex: '[.#]' with: ' ') asCamelCase.
					anApObject properties
						keysAndValuesDo: [ :aPropertyKey :aProperty | 
							self
								buildPropertyInClass: className
								forObject: anApObject
								inModel: aModel
								usingPropertyKey: aPropertyKey
								andProperty: aProperty ] ] ]
]
