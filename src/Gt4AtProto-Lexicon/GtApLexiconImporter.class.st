Class {
	#name : #GtApLexiconImporter,
	#superclass : #Object,
	#instVars : [
		'cachedMappings'
	],
	#category : #'Gt4AtProto-Lexicon-Importer'
}

{ #category : #accessing }
GtApLexiconImporter class >> fromStream: aStream [
	^ self new 
		importLexiconDocumentFromStream: aStream
]

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
GtApLexiconImporter >> importLexiconDocumentFromDefinition: aSchemaDefinition [ 
	^ GtApLexiconDocument new
		lexicon: aSchemaDefinition lexicon;
		id: aSchemaDefinition id;
		description: aSchemaDefinition description;
		revision: aSchemaDefinition revision;
		definitions: (aSchemaDefinition defs associations collect: [ :assoc | 
			assoc key -> ((self importLexiconSchemaFrom: assoc value) 
				id: aSchemaDefinition id, '#', assoc key) ]) asOrderedDictionary 
]

{ #category : #accessing }
GtApLexiconImporter >> importLexiconDocumentFromStream: aStream [ 
	| schemaDefinition |
	
	schemaDefinition := GtApLexiconNeoJsonObject  fromStream:  aStream.
	^ self importLexiconDocumentFromDefinition: schemaDefinition
]

{ #category : #accessing }
GtApLexiconImporter >> importLexiconSchemaFrom: aSchemaData [
	^ self 
		createSchemaOfType: (self mappingForSchemaDefinition: aSchemaData)  
		fromData: aSchemaData
]

{ #category : #accessing }
GtApLexiconImporter >> importLexiconsFromDirectory: aDirectory [
	| lexicons |
	lexicons := GtApLexicons new.
	
	(aDirectory allChildrenMatching: '*.json') do: [ :aLexiconFile |
		| document | 
		document := aLexiconFile readStreamDo: [ :aStream |
			self importLexiconDocumentFromStream:  aStream ].
		lexicons addLexiconDocument:  document ].
		
	GtApLexiconReferencesRevolver new 
		resolveLexicon: lexicons.
	
	^ lexicons
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
GtApLexiconImporter >> transformIfNeededLexiconSchemaValue: aValue [
	(aValue isKindOf: GtApLexiconNeoJsonObject) ifFalse: [ ^ aValue ].
	
	^ ((aValue includesKey: #type) and: [(aValue at: #type) isString ])
		ifTrue: [ self importLexiconSchemaFrom: aValue ]
		ifFalse: [
			aValue collect: [ :each | 
				self transformIfNeededLexiconSchemaValue: each ] ] 
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
