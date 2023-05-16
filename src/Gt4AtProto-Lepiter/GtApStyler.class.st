Class {
	#name : #GtApStyler,
	#superclass : #GtCompositeSmaCCASTStyler,
	#instVars : [
		'lexicons',
		'styler',
		'document'
	],
	#category : #'Gt4AtProto-Lepiter-Styler'
}

{ #category : #private }
GtApStyler >> document [
	^ document
		ifNil: [ document := [ GtApLexiconImporter new
					importLexiconDocumentFromStream: text asString readStream ]
					on: Error
					do: [ :ex | ex return: nil ] ]
]

{ #category : #initialization }
GtApStyler >> initialize [
	super initialize.
	self parserClass: JSONParser.
	self stylers: {JSONParser gtStyler}
]

{ #category : #accessing }
GtApStyler >> lexicons [
	^ lexicons
]

{ #category : #accessing }
GtApStyler >> lexicons: anObject [
	lexicons := anObject
]

{ #category : #accessing }
GtApStyler >> style: aText ast: anAST [
	[ text := aText.
	super style: aText ast: anAST.
	self styler style: aText ast: anAST ]
		ensure: [ text := nil.
			document := nil ]
]

{ #category : #private }
GtApStyler >> styleReference: node in: txt [
	| source lexiconObject |
	source := node value source.
	(source includes: $#) ifFalse: [ ^ self ].
	(source beginsWith: '"#')
		ifTrue: [ self document
				ifNotNil: [ :doc | 
					doc definitions
						at: (source copyFrom: 3 to: source size - 1)
						ifPresent: [ :obj | lexiconObject := obj ] ] ]
		ifFalse: [ lexicons
				ifNotNil: [ lexicons definitions
						at: source allButFirst allButLast
						ifPresent: [ :obj | lexiconObject := obj ] ] ].
	lexiconObject
		ifNotNil: [ | position |
			position := node stopPosition.
			txt
				attribute: (BrTextAdornmentDynamicAttribute new
						beAppend;
						stencil: [ BrButton new
								background: BrGlamorousColors defaultButtonBorderColor;
								size: 8 @ 8;
								geometry: BlEllipseGeometry new;
								margin: (BlInsets left: 2 right: 2);
								action: [ :button | button phlow spawnObject: lexiconObject ] ])
				from: position
				to: position ]
]

{ #category : #private }
GtApStyler >> styler [
	^ styler
		ifNil: [ styler := (GtSmaCCParserStyler forParser: YAMLParser)
					stylerRules: {GtSmaCCNodeStylerRule
								nodeClassName: #JSONStringNode
								styleBlock: [ :styleable :node :txt | self styleReference: node in: txt ]} ]
]
