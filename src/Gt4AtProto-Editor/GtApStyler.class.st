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
GtApStyler >> highlight: aNodeOrToken in: txt [
	txt
		attribute: (BlTextHighlightAttribute new
				paint: BrGlamorousColors neutralBackgroundColor)
		from: aNodeOrToken startPosition + 1
		to: aNodeOrToken stopPosition - 1
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

{ #category : #private }
GtApStyler >> shouldHighlightName: aMemberNode [
	(aMemberNode parent isKindOf: JSONObjectNode) ifFalse: [ ^ false ].
	(aMemberNode parent parent isKindOf: JSONMemberNode)
		ifTrue: [ ^ #('"defs"' '"properties"') includes: aMemberNode parent parent name value ].
	^ false
]

{ #category : #private }
GtApStyler >> shouldHighlightString: aStringNode [
	(aStringNode parent isKindOf: JSONMemberNode)
		ifTrue: [ ^ #('"id"') includes: aStringNode parent name value ].
	((aStringNode parent isKindOf: JSONArrayNode)
		and: [ aStringNode parent parent isKindOf: JSONMemberNode ])
		ifTrue: [ ^ #('"required"') includes: aStringNode parent parent name value ].
	^ false
]

{ #category : #accessing }
GtApStyler >> style: aText ast: anAST [
	[ text := aText.
	super style: aText ast: anAST.
	self styler style: aText ast: anAST ] ensure: [ text := nil ]
]

{ #category : #private }
GtApStyler >> styleReference: aStringNode in: txt [
	| source block |
	(lexiconFile isReference: aStringNode) ifFalse: [ ^ self ].
	source := aStringNode value source.
	(source beginsWith: '"#')
		ifTrue: [ (lexiconFile definitionNamed: (source copyFrom: 3 to: source size - 1))
				ifNotNil: [ :def | block := [ def ] ] ]
		ifFalse: [ self lexicons
				ifNotNil: [ (self lexicons
						definitionWithId: (source copyFrom: 2 to: source size - 1)
						ifAbsent: [  ])
						ifNotNil: [ :obj | 
							block := [ (lexiconFile lexiconDirectory fileFor: obj documentFile)
									ifNotNil: [ :file | 
										file
											definitionNamed: ((source includes: $#)
													ifTrue: [ source copyFrom: (source indexOf: $#) + 1 to: source size - 1 ]
													ifFalse: [ 'main' ]) ] ] ] ] ].
	block
		ifNotNil: [ | position |
			position := aStringNode stopPosition - 1.
			self highlight: aStringNode in: txt.
			block value
				ifNotNil: [ :obj | 
					txt
						attributes: {BrTextAdornmentDynamicAttribute new
									beAppend;
									stencil: [ BrButton new
											background: BrGlamorousColors defaultButtonBorderColor;
											size: 8 @ 8;
											geometry: BlEllipseGeometry new;
											margin: (BlInsets left: 2 right: 2);
											action: [ :button | 
												button phlow
													spawnTool: (GtPhlowValuableTool new
															name: obj gtDisplayString;
															valuable: [ GtApLexiconCoder new object: obj ]) ] ].
								BrGlamorousTriangleExpanderTextAttribute new
									isExpanded: false;
									attributesCreatingBlock: [ BrTextAdornmentDynamicAttribute new
											beAppend;
											stencil: [ GtApLexiconCoder new
													object: obj;
													background: Color white;
													addAptitude: BrShadowAptitude ] ]}
						from: position
						to: position ] ]
]

{ #category : #private }
GtApStyler >> styler [
	^ styler
		ifNil: [ styler := (GtSmaCCParserStyler forParser: YAMLParser)
					stylerRules: {GtSmaCCNodeStylerRule
								nodeClassName: #JSONStringNode
								styleBlock: [ :styleable :node :txt | 
									self styleReference: node in: txt.
									(self shouldHighlightString: node)
										ifTrue: [ self highlight: node in: txt ] ].
							GtSmaCCNodeStylerRule
								nodeClassName: #JSONMemberNode
								styleBlock: [ :styleable :node :txt | (self shouldHighlightName: node) ifTrue: [ self highlight: node name in: txt ] ]} ]
]
