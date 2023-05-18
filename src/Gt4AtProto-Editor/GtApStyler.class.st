Class {
	#name : #GtApStyler,
	#superclass : #GtCompositeSmaCCASTStyler,
	#instVars : [
		'styler',
		'document',
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-Styler'
}

{ #category : #private }
GtApStyler >> editorForNode: aNode [
	| editor |
	editor := BrEditor new.
	editor aptitude: (GtApEditorAptitude new lexiconFile: lexiconFile).
	editor text: aNode completeSource.
	editor
		enqueueTask: [ editor editor
				moveCursorTo: aNode value startPosition - 1;
				select: aNode value startPosition - 1 to: aNode value stopPosition.
			aNode gtScrollToPosition: aNode value stopPosition inEditor: editor ]
				asBlTask.
	^ editor
]

{ #category : #private }
GtApStyler >> findReferenceTo: aString in: aNode [
	^ ((((aNode / JSONMemberNode) @ #name <- '"defs"') / JSONObjectNode
		/ JSONMemberNode) @ #name <- ('"' , aString , '"')) asOrderedCollection
		at: 1
		ifAbsent: [  ]
]

{ #category : #private }
GtApStyler >> findReferenceTo: aString inFile: aFilename [
	| ref ast |
	ref := aFilename asFileReference.
	ref exists ifFalse: [ ^ nil ].
	ast := JSONParser parseFileWithErrors: ref.
	^ self findReferenceTo: aString in: ast
]

{ #category : #initialization }
GtApStyler >> initialize [
	super initialize.
	self parserClass: JSONParser.
	self stylers: {JSONParser gtStyler}
]

{ #category : #accessing }
GtApStyler >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApStyler >> lexiconFile: anObject [
	lexiconFile := anObject
]

{ #category : #accessing }
GtApStyler >> lexicons [
	^ lexiconFile lexicons
]

{ #category : #accessing }
GtApStyler >> style: aText ast: anAST [
	[ text := aText.
	super style: aText ast: anAST.
	self styler style: aText ast: anAST ] ensure: [ text := nil ]
]

{ #category : #private }
GtApStyler >> styleReference: node in: txt [
	| source block |
	source := node value source.
	(source includes: $#) ifFalse: [ ^ self ].
	(source beginsWith: '"#')
		ifTrue: [ (lexiconFile definitionNamed: (source copyFrom: 3 to: source size - 1))
				ifNotNil: [ :def | block := [ def ] ] ]
		ifFalse: [ self lexicons
				ifNotNil: [ self lexicons definitions
						at: (source copyFrom: 2 to: source size - 1)
						ifPresent: [ :obj | 
							block := [ | file |
								file := GtApLexiconFile new
										filename: obj documentFile;
										lexicons: self lexicons;
										yourself.
								file
									definitionNamed: (source copyFrom: (source indexOf: $#) + 1 to: source size - 1) ] ] ] ].
	block
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
								action: [ :button | block value ifNotNil: [ :obj | button phlow spawnObject: obj ] ] ])
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