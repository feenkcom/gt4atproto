Class {
	#name : #GtApGenericLexiconImporter,
	#superclass : #Object,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #api }
GtApGenericLexiconImporter class >> fromStream: aStream [
	^ self new 
		importLexiconDocumentFromStream: aStream
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconDocumentFromDefinition: aSchemaDefinition [ 
	^ GtApLexiconDocument new
		lexicon: aSchemaDefinition lexicon;
		id: aSchemaDefinition id;
		description: aSchemaDefinition description;
		revision: aSchemaDefinition revision;
		definitions: (aSchemaDefinition defs associations collect: [ :assoc | 
			assoc key -> ((self importLexiconSchemaFrom: assoc value) 
				id: aSchemaDefinition id, '#', assoc key) ]) asOrderedDictionary 
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconDocumentFromStream: aStream [ 
	| schemaDefinition |
	
	schemaDefinition := GtApLexiconNeoJsonObject  fromStream:  aStream.
	^ self importLexiconDocumentFromDefinition: schemaDefinition
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconSchemaFrom: aSchemaData [
	aSchemaData type = #ref
		ifTrue: [ ^ GtApLexiconReference new 
			referenceString: aSchemaData ref ].
			
	^ GtApLexiconGenericDefinition new
		rawData: aSchemaData;
		type: aSchemaData type;
		attributes: (aSchemaData collect: [ :aValue |
			self transforIfNeededLexiconSchemaValue: aValue ])
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconsFromDirectory: aDirectory [
	| lexicons |
	lexicons := GtApLexicons new.
	
	(aDirectory allChildrenMatching: '*.json') do: [ :aLexiconFile |
		| document | 
		document := aLexiconFile readStreamDo: [ :aStream |
			self importLexiconDocumentFromStream:  aStream ].
		lexicons addLexiconDocument:  document ].
		
	GTApLexiconReferencesRevolver new 
		resolveLexicon: lexicons.
	
	^ lexicons
]

{ #category : #importing }
GtApGenericLexiconImporter >> transforIfNeededLexiconSchemaValue: aValue [
	(aValue isKindOf: GtApLexiconNeoJsonObject) ifFalse: [ ^ aValue ].
	
	^ ((aValue includesKey: #type) and: [(aValue at: #type) isString ])
		ifTrue: [ self importLexiconSchemaFrom: aValue ]
		ifFalse: [
			aValue collect: [ :each | 
				self transforIfNeededLexiconSchemaValue: each ] ] 
]
