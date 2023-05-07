Class {
	#name : #GtApLexiconImporter,
	#superclass : #GtApGenericLexiconImporter,
	#instVars : [
		'cachedMappings'
	],
	#category : #'Gt4AtProto-Lexicon-Importer'
}

{ #category : #accessing }
GtApLexiconImporter >> cacheMappings [
	cachedMappings := (self modelClasses
		collect: [ :aClass | aClass typeName -> aClass name ]) asOrderedDictionary
]

{ #category : #accessing }
GtApLexiconImporter >> createSchemaOfType: aSchemaType fromData: aSchemaData [
	| lexiconValue transformedValues |
	
	transformedValues := aSchemaType needsCustomAttributeMappings
		ifTrue: [
			self 
				transformUsingAttributeMappingsSchemaType: aSchemaType 
				fromData: aSchemaData ]
		ifFalse: [ (aSchemaData collect: [ :aValue |
			self transformIfNeededLexiconSchemaValue: aValue ])].

	lexiconValue := aSchemaType new.
	lexiconValue rawData: aSchemaData.
	self 
		initializeLexicon: lexiconValue 
		fromSchemaData: transformedValues.
	^ lexiconValue
]

{ #category : #accessing }
GtApLexiconImporter >> importLexiconSchemaFrom: aSchemaData [
	^ self 
		createSchemaOfType: (self mappingForSchemaDefinition: aSchemaData)  
		fromData: aSchemaData
]

{ #category : #accessing }
GtApLexiconImporter >> initializeLexicon: aLexiconEntity fromSchemaData: aSchemaData [ 
	aLexiconEntity class allSlots do: [ :aSlot |
		(aSchemaData includesKey: aSlot name)
			ifTrue: [ 
				aSlot 
					write: (aSchemaData at: aSlot name)
					to: aLexiconEntity ]]
]

{ #category : #accessing }
GtApLexiconImporter >> mappingForSchemaDefinition: aSchemaData [ 
	^ (self mappings at: aSchemaData type) asClass 
]

{ #category : #accessing }
GtApLexiconImporter >> mappings [
	^ cachedMappings ifNil: [
	 	self cacheMappings.
	 	cachedMappings ]
]

{ #category : #accessing }
GtApLexiconImporter >> modelClasses [
	^ GtApLexiconDefinition allSubclasses , {GtApLexiconDefinitionReference}
		select: [ :aClass | aClass classSide includesSelector: #typeName ]
]

{ #category : #accessing }
GtApLexiconImporter >> transformUsingAttributeMappingsSchemaType: aSchemaType fromData: aSchemaData [ 
	| customMappings |
	
	customMappings := aSchemaType customAttributeMappings asOrderedDictionary.
	^ (aSchemaData associations collect: [ :assoc |
		assoc key -> (customMappings 
			at: assoc key
			ifPresent: [ :aMappingBlock |
				aMappingBlock value: self value: assoc value ]
			ifAbsent: [
				self transformIfNeededLexiconSchemaValue: assoc value ]) ]) asOrderedDictionary
]
