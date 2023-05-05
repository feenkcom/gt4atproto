Class {
	#name : #GtApLexiconObject,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'required',
		'properties'
	],
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #'instance creation' }
GtApLexiconObject class >> empty [
	^ self new
		properties: {} asDictionary;
		required: {}
]

{ #category : #'instance creation' }
GtApLexiconObject class >> from: aDefinition [
	^ self new
		properties: (aDefinition attributes at: #properties);
		required: (aDefinition attributes at: #required)
]

{ #category : #accessing }
GtApLexiconObject class >> typeName [
	^ #object
]

{ #category : #accessing }
GtApLexiconObject >> asObject [
	^ self
]

{ #category : #'gt - extensions' }
GtApLexiconObject >> gtViewPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 10;
		items: [ self properties associations ];
		column: 'Property'
			text: [ :assoc | 
				(self isPropertyRequired: assoc key)
					ifTrue: [ assoc key asRopedText bold ]
					ifFalse: [ assoc key ] ] width: 150;
		column: 'Required'
			text: [ :assoc | (self isPropertyRequired: assoc key) 
				ifTrue: [ 'yes' ] 
				ifFalse: [ '' ] ]
			width: 75;
		column: 'Type' text: [ :assoc | assoc value typeDescription ];
		column: 'Description'
			text: [ :assoc | assoc value description ifNil: [ '' ] ];
		send: [ :assoc |
			assoc value isReference
				ifTrue: [ assoc value referencedDefinition ifNil: [ assoc value ] ] 
				ifFalse: [ assoc value ] ]
]

{ #category : #accessing }
GtApLexiconObject >> isPropertyRequired: aPropertyName [
	^ required isNotNil and: [ required includes: aPropertyName ]
]

{ #category : #accessing }
GtApLexiconObject >> magritteDescription [
	| basicDescription |
	basicDescription := GtApMagritteBuilder for: self.

	^ basicDescription
]

{ #category : #printing }
GtApLexiconObject >> printOn: aStream [
	super printOn: aStream.
	
	self id ifNotNil: [
		aStream parenthesize: [
			aStream << self id ]] 
]

{ #category : #accessing }
GtApLexiconObject >> properties [
	^ properties
]

{ #category : #accessing }
GtApLexiconObject >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
GtApLexiconObject >> referencedDefinitions [
	^ properties values
]

{ #category : #accessing }
GtApLexiconObject >> required [
	^ required
]

{ #category : #accessing }
GtApLexiconObject >> required: anObject [
	required := anObject
]

{ #category : #accessing }
GtApLexiconObject >> typeDescription [
	^ self id 
		ifNil: [ super typeDescription]
		ifNotNil: [ super typeDescription, '(', self id, ')' ]
]
