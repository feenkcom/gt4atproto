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
	lexiconValue := aSchemaType new.
	lexiconValue rawData: aSchemaData.
	transformedValues := aSchemaType needsCustomAttributeMappings
		ifTrue: [
			self 
				transformUsingAttributeMappingsSchema: lexiconValue 
				fromData: aSchemaData ]
		ifFalse: [ (aSchemaData collect: [ :aValue |
			self transformIfNeededLexiconSchemaValue: aValue ])].
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
GtApLexiconImporter >> transformUsingAttributeMappingsSchema: aSchemaDefinition fromData: aSchemaData [ 
	| customMappings |
	
	customMappings := aSchemaDefinition class customAttributeMappings asOrderedDictionary.
	^ (aSchemaData associations collect: [ :assoc |
		assoc key -> (customMappings 
			at: assoc key
			ifPresent: [ :aMappingBlock |
				aMappingBlock value: self value: assoc value ]
			ifAbsent: [
				self transformIfNeededLexiconSchemaValue: assoc value ]) ]) asOrderedDictionary
]
