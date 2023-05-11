Class {
	#name : #GtApLexiconObject,
	#superclass : #GtApLexiconCustomDefinition,
	#instVars : [
		'required',
		'properties'
	],
	#category : #'Gt4AtProto-Lexicon-Definitions'
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

{ #category : #visiting }
GtApLexiconObject >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconObject:  self
]

{ #category : #accessing }
GtApLexiconObject >> asClassName [
	^ (self id replaceAllRegex: '[.#]' with: ' ') asCamelCase
]

{ #category : #accessing }
GtApLexiconObject >> asObject [
	^ self
]

{ #category : #accessing }
GtApLexiconObject >> generateDeserialization [
	self hasId ifTrue: [ ^ self asClassName , ' fromRequest: ' ].	
	
	"we only treat this if we have only one other property"
	(self properties includesKey: 'cursor')
		ifTrue: [ | filteredProperties propertyKey property |
			filteredProperties := self properties keys
					reject: [ :aKey | 
						{'limit'.
							'cursor'} includes: aKey ].

			filteredProperties size > 1 ifTrue: [ ^ '' ].

			propertyKey := filteredProperties anyOne.
			property := self properties at: propertyKey.

			^ 'AsyncMapStream mapBlock: [:aDictionary | '
				, property items generateDeserialization , ' aDictionary ] stream: ' ].

	^ ''
]

{ #category : #'gt - extensions' }
GtApLexiconObject >> gtViewDefinitionReferencesFor: aView [ 
	<gtView>
	
	^ aView mondrian
		title: 'Definition References';
		priority: 15;
		painting: [ :view | 
			self 
				paintDefinitionReferences: self withAllReferencedObjects 
				on: view ]
]

{ #category : #accessing }
GtApLexiconObject >> gtViewFormFor: aView [
	<gtView>
	| objectClass |
	self hasId ifFalse: [ ^ aView empty ].
	
	objectClass := self asClassName asClassIfAbsent: [ ^ aView empty ].
	
	^ aView explicit
		title: 'Form';
		priority: 1;
		stencil: [
			objectClass new asGtMagritteViewModel
		]
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
GtApLexiconObject >> hasId [
	^ id isNotNil
]

{ #category : #testing }
GtApLexiconObject >> isObjectDefinition [
	^ true
]

{ #category : #accessing }
GtApLexiconObject >> isPropertyRequired: aPropertyName [
	^ required isNotNil and: [ required includes: aPropertyName ]
]

{ #category : #'gt - extensions' }
GtApLexiconObject >> paintDefinitionReferences: aCollectionOfDefinitions on: aView [
	aView nodes
		stencil: [ :aDefinition | 
			| string container |
			string := aDefinition id ifNil: [ aDefinition type asString ].
			container := BrVerticalPane new
					fitContent;
					margin: (BlInsets all: 10);
					aptitude: BrShadowAptitude;
					padding: (BlInsets all: 5);
					background: (aDefinition == self
							ifTrue: [ Color blue muchLighter ]
							ifFalse: [ Color white ]).
			(string findTokens: '#')
				do: [ :token | 
					container
						addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude new;
								text: token) ].
			container ];
		with: aCollectionOfDefinitions.

	aView edges
		stencil: [ :aDefinition :fromElement :toElement | 
			| lineColor |
			lineColor := Color gray alpha: 0.2.
			fromElement = toElement
				ifFalse: [ BlLineElement new
						border: lineColor;
						toHead: (BlArrowheadSimpleArrow new border: lineColor) ]
				ifTrue: [ BlParabollaArcElement new
						zIndex: 0;
						curvatureFraction: 0.5;
						border: lineColor;
						toHead: (BlArrowheadSimpleArrow new border: lineColor) ] ];
		connectToAll: [ :aDefinition | aDefinition resolvedReferencedDefinitions ].

	aView layout horizontalTree levelDistance: 30; nodeDistance: 10.

	aView
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

{ #category : #traversing }
GtApLexiconObject >> withAllReferencedObjects [
	| referencedObjects |
	referencedObjects := OrderedCollection new.
	self withAllReferencedDefinitionsDo: [ :aDefiniton |
		aDefiniton isObjectDefinition ifTrue: [
			(referencedObjects includes: aDefiniton)
				ifFalse: [ 
					referencedObjects add: aDefiniton ] ] ].
	^ referencedObjects 
]
