Class {
	#name : #GtApGenericLexiconImporter,
	#superclass : #Object,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #api }
GtApGenericLexiconImporter class >> fromStream: aStream [
	^ self new 
		importFromStream: aStream
]

{ #category : #importing }
GtApGenericLexiconImporter >> importFromDirectory: aDirectory [
	| lexicons |
	lexicons := GtApLexicons new.
	
	(aDirectory allChildrenMatching: '*.json') do: [ :aLexiconFile |
		| document | 
		document := aLexiconFile readStreamDo: [ :aStream |
			self importFromStream:  aStream ].
		lexicons addLexiconDocument:  document ].
	
	^ lexicons
]

{ #category : #importing }
GtApGenericLexiconImporter >> importFromStream: aStream [ 
	| schemaDefinition |
	
	schemaDefinition := GtApLexiconNeoJsonObject  fromStream:  aStream.
	^ self importLexiconDocumentFrom: schemaDefinition
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconDocumentFrom: aSchemaDefinition [ 
	^ GtApLexiconDocument new
		lexicon: aSchemaDefinition lexicon;
		id: aSchemaDefinition id;
		description: aSchemaDefinition description;
		revision: aSchemaDefinition revision;
		definitions: (aSchemaDefinition defs collect: [ :each | 
			self importLexiconSchemaFrom: each ])
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconSchemaFrom: aSchemaData [
	aSchemaData type = #ref
		ifTrue: [ ^ GtApLexiconReference new 
			referenceString: aSchemaData ref ].
			
	^ (GtApLexiconGenericDefinition new
		rawData: aSchemaData;
		type: aSchemaData type;
		attributes: (aSchemaData collect: [ :aValue |
			self transforIfNeededLexiconSchemaValue: aValue ]))
]

{ #category : #importing }
GtApGenericLexiconImporter >> importLexiconsFromDirectory: aDirectory [
	| lexicons |
	lexicons := GtApLexicons new.
	
	(aDirectory allChildrenMatching: '*.json') do: [ :aLexiconFile |
		| document | 
		document := aLexiconFile readStreamDo: [ :aStream |
			self importFromStream:  aStream ].
		lexicons addLexiconDocument:  document ].
	
	^ lexicons
]

{ #category : #importing }
GtApGenericLexiconImporter >> transforIfNeededLexiconSchemaValue: aValue [
	(aValue isKindOf: GtApLexiconNeoJsonObject) ifFalse: [ ^ aValue ].
	
	^ (aValue includesKey: #type)
		ifTrue: [ self importLexiconSchemaFrom: aValue ]
		ifFalse: [
			aValue collect: [ :each | 
				self transforIfNeededLexiconSchemaValue: each ] ] 
]
