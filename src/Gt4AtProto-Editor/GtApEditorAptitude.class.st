Class {
	#name : #GtApEditorAptitude,
	#superclass : #BrGlamorousCodeEditorAptitude,
	#instVars : [
		'lexiconFile'
	],
	#category : #'Gt4AtProto-Editor-Aptitude'
}

{ #category : #initialization }
GtApEditorAptitude >> initialize [
	| controller |
	super initialize.
	self
		addChange: (BrLookChange new
				up: [ :e | 
					| completion |
					widget viewModel styler: self styler.
					completion := GtApCompletionStrategy new.
					completion lexiconFile: lexiconFile.
					controller := GtCompletionController on: widget strategy: completion.
					controller install ];
				down: [ :e | controller ifNotNil: [ controller uninstall ] ];
				yourself)
]

{ #category : #accessing }
GtApEditorAptitude >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApEditorAptitude >> lexiconFile: aGtApLexiconFile [
	| apStyler |
	lexiconFile := aGtApLexiconFile.
	apStyler := GtApStyler new.
	apStyler lexiconFile: lexiconFile.
	self styler: apStyler
]

{ #category : #initialization }
GtApEditorAptitude >> styler [
	^ styler
]
