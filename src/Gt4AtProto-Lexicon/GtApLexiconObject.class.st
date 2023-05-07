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
GtApLexiconObject >> asObject [
	^ self
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

{ #category : #testing }
GtApLexiconObject >> isObjectDefinition [
	^ true
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

{ #category : #'gt - extensions' }
GtApLexiconObject >> paintDefinitionReferences: aCollectionOfDefinitions on: aView [
	aView nodes
		stencil: [ :aDefinition | 
			BrFrame new
				fitContent;
				padding: (BlInsets all: 5);
				addChild: (BrLabel new
						fitContent;
						aptitude: (BrGlamorousLabelAptitude new
							highlight: (aDefinition == self
								ifTrue: [Color red muchLighter]
								ifFalse:[Color transparent]));
						text: (aDefinition id ifNil: [ aDefinition type asString ])) ];
		with: aCollectionOfDefinitions.

	aView edges
		stencil: [ :aDefinition :fromElement :toElement | 
			| lineColor |
			lineColor := Color gray alpha: 0.2.
			fromElement = toElement
				ifFalse: [ BlLineElement new
						border: (BlBorder paint: lineColor width: 1);
						toHead: (BlArrowheadSimpleArrow new 
							border: (BlBorder paint: lineColor width: 1)) ]
				ifTrue: [ BlParabollaArcElement new
						zIndex: 0;
						curvatureFraction: 0.5;
						border: (BlBorder paint: lineColor width: 1);
						toHead: (BlArrowheadSimpleArrow new 
							border: (BlBorder paint: lineColor width: 1)) ] ];
		connectToAll: [ :aDefinition | aDefinition resolvedReferencedDefinitions ].

	aView layout horizontalTree.

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
