Class {
	#name : #GtApLexiconGenerator,
	#superclass : #Object,
	#instVars : [
		'classes',
		'id',
		'description'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconGenerator class >> forClasses: aCollection [
	^ self new classes: aCollection
]

{ #category : #accessing }
GtApLexiconGenerator >> addClass: aClass [
	classes add: aClass
]

{ #category : #accessing }
GtApLexiconGenerator >> baselineClasses [
	^ {'String' -> [ GtApLexiconString new ].
		'Boolean' -> [ GtApLexiconBoolean new ].
		'Number' -> [ GtApLexiconNumber new ].
		'Integer' -> [ GtApLexiconInteger new ].
		'Symbol' -> [ GtApLexiconString new ].
		'Dictionary' -> [ GtApLexiconUnknownDefinition new ].
		'DateAndTime' -> [ GtApLexiconString new format: 'datetime' ].
		'Array' -> [ GtApLexiconArray new items: GtApLexiconString new ]} asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> classes [
	^ classes
]

{ #category : #accessing }
GtApLexiconGenerator >> classes: aCollection [ 
	classes := aCollection
]

{ #category : #accessing }
GtApLexiconGenerator >> description [
	^ description
]

{ #category : #accessing }
GtApLexiconGenerator >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApLexiconGenerator >> generateJson [
	^ STONJSON
		toStringPretty: {'lexicon' -> 1.
				'id' -> self id.
				'description' -> self description.
				'defs'
					-> (self generateModel
							collect: [ :aRecord | aRecord key -> aRecord record generateJson ])
							asDictionary} asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> generateLexiconForClass: aClass [
	^ GtApLexiconRecord new
		key: aClass name asLowercase;
		id: (self idFromClassName: aClass name withSeparator: '.');
		description: aClass comment;
		record: (self generateRecordForClass: aClass)
]

{ #category : #accessing }
GtApLexiconGenerator >> generateModel [
	"we generate using an explicit whileTrue: loop because the classes collection might change size during our iteration"

	| idx res |
	idx := 1.
	res := OrderedCollection new.
	[ idx <= classes size ]
		whileTrue: [ | aClass |
			aClass := classes at: idx.
			res add: (self generateLexiconForClass: aClass).
			idx := idx + 1 ].
	^ res
]

{ #category : #accessing }
GtApLexiconGenerator >> generatePropertyIn: aClass named: aKey [
	^ (aClass lookupSelector: aKey) pragmas
		detect: [ :aPragma | aPragma selector = #return: ]
		ifFound: [ :aPragma | self treatProperty: (aPragma argumentAt: 1) ]
		ifNone: [ GtApLexiconString new ]
]

{ #category : #accessing }
GtApLexiconGenerator >> generateRecordForClass: aClass [
	| attributes |
	aClass isAbstract
		ifTrue: [ ^ GtApLexiconUnion new
				refs: (aClass allSubclasses
						reject: #isAbstract
						thenCollect: [ :aSubclass | self idFromClassName: aSubclass name withSeparator: '#' ]) ].

	attributes := aClass leJsonV4AttributeMapping collect: #key.
	^ GtApLexiconObject new
		required: attributes;
		properties: (attributes
				collect: [ :aKey | aKey -> (self generatePropertyIn: aClass named: aKey) ])
				asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> id [
	^ id
]

{ #category : #accessing }
GtApLexiconGenerator >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtApLexiconGenerator >> idFromClassName: aClassName withSeparator: aString [
	^ self id , aString , aClassName asLowercase
]

{ #category : #accessing }
GtApLexiconGenerator >> initialize [
	classes := OrderedCollection new
]

{ #category : #accessing }
GtApLexiconGenerator >> treatProperty: aString [
	| aClass |
	self baselineClasses at: aString ifPresent: [ :aBlock | ^ aBlock value ].

	aClass := aString
			asClassIfAbsent: [ self error: 'Unknown class to generate ' , aString ].

	(aClass respondsTo: #asLexiconPropertyIn:)
		ifTrue: [ ^ aClass asLexiconPropertyIn: self ].

	(classes includes: aClass) ifFalse: [ self addClass: aClass ].

	^ GtApLexiconDefinitionReference new
		referenceString: (self idFromClassName: aString withSeparator: '#')
]
