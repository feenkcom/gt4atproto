Class {
	#name : #GtApLexiconGenerator,
	#superclass : #Object,
	#instVars : [
		'classes'
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
	^ {'String' -> 'string'.
		'Boolean' -> 'boolean'.
		'Number' -> 'number'.
		'Integer' -> 'integer'.
		'Symbol' -> 'string'.
		'DateAndTime'
			-> {'type' -> 'string'.
					'format' -> 'datetime'} asOrderedDictionary} asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> classes: aCollection [ 
	classes := aCollection
]

{ #category : #accessing }
GtApLexiconGenerator >> defaults [
	^ {'lexicon' -> 1.
		'type' -> 'record'} asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> generate [
	"we generate using an explicit whileTrue: loop because the classes collection might change size during our iteration"

	| idx res |
	idx := 1.
	res := OrderedCollection new.
	[ idx < classes size ]
		whileTrue: [ | aClass |
			aClass := classes at: idx.
			res add: (self generateLexiconForClass: aClass).
			idx := idx + 1 ].
	^ res
]

{ #category : #accessing }
GtApLexiconGenerator >> generateJson [
	^ self generate collect: [ :aLexicon | STONJSON toStringPretty: aLexicon ]
]

{ #category : #accessing }
GtApLexiconGenerator >> generateLexiconForClass: aClass [
	| attributes |
	attributes := aClass leJsonV4AttributeMapping collect: #key.
	^ self defaults
		union: {'id' -> (self idFromClassName: aClass name).
				'description' -> aClass comment.
				'record'
					-> {'type' -> 'object'.
							'required' -> attributes asArray.
							'properties'
								-> (attributes
										collect: [ :aKey | aKey -> (self generatePropertyIn: aClass named: aKey) ])
										asDictionary} asDictionary} asDictionary asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> generatePropertyIn: aClass named: aKey [
	| aProperty |
	aProperty := (aClass lookupSelector: aKey) pragmas
			detect: [ :aPragma | aPragma selector = #return: ]
			ifFound: [ :aPragma | self treatProperty: (aPragma argumentAt: 1) ]
			ifNone: [ 'string' ].

	(aProperty isKindOf: Dictionary) ifTrue: [ ^ aProperty ].

	^ {'type' -> aProperty} asDictionary
]

{ #category : #accessing }
GtApLexiconGenerator >> idFromClassName: aClassName [
	^ self idPrefix , aClassName asLowercase
]

{ #category : #accessing }
GtApLexiconGenerator >> idPrefix [
	^ 'com.gtoolkit.lepiter.'
]

{ #category : #accessing }
GtApLexiconGenerator >> initialize [
	classes := OrderedCollection new
]

{ #category : #accessing }
GtApLexiconGenerator >> treatProperty: aString [
	| aClass |
	self baselineClasses at: aString ifPresent: [ :aValue | ^ aValue ].

	aClass := aString asClassIfAbsent: [ ^ aString ].


	(classes includes: aClass) ifFalse: [ self addClass: aClass ].

	^ self idFromClassName: aString
]
