Class {
	#name : #GtApLexiconImporter,
	#superclass : #GtApGenericLexiconImporter,
	#instVars : [
		'cachedMappings'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconImporter >> cacheMappings [
	cachedMappings := (self modelClasses
		collect: [ :aClass | aClass typeName -> aClass name ]) asOrderedDictionary
]

{ #category : #accessing }
GtApLexiconImporter >> importLexiconSchemaFrom: aSchemaData [
	| lexiconValue |
	lexiconValue := (self mappingForSchemaDefinition: aSchemaData) new.
	lexiconValue rawData: aSchemaData.
	self 
		initializeLexicon: lexiconValue 
		fromSchemaData: (aSchemaData collect: [ :aValue |
			self transforIfNeededLexiconSchemaValue: aValue ]).
	^ lexiconValue
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
	^ GtApLexiconDefinition allSubclasses , {GtApLexiconReference}
		select: [ :aClass | aClass classSide includesSelector: #typeName ]
]
