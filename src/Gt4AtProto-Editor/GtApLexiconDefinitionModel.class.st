Class {
	#name : #GtApLexiconDefinitionModel,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'lexiconFile',
		'name'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApLexiconDefinitionModel >> editor [
	| editor |
	editor := lexiconFile editor.
	editor
		enqueueTask: [ editor editor
				moveCursorTo: self node value startPosition - 1;
				select: self node value startPosition - 1 to: self node value stopPosition.
			self node gtScrollToPosition: self node value startPosition inEditor: editor ]
				asBlTask.
	^ editor
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> gtSourceFor: aView [
	<gtView>
	| editor |
	^ aView explicit
		title: 'Source';
		stencil: [ editor := self editor ];
		actionButtonIcon: BrGlamorousVectorIcons accept
			tooltip: 'Save'
			action: [ lexiconFile
					source: editor editor text asString;
					saveFile ]
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> id [
	^ lexiconFile id ifNotNil: [ :id | id , '#' , name ]
]

{ #category : #testing }
GtApLexiconDefinitionModel >> isLexiconDefinition [
	^ true
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconDirectory [
	^ self lexiconFile lexiconDirectory
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconFile: aGtApLexiconFile [
	lexiconFile := aGtApLexiconFile
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> name [
	^ name
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> name: aString [
	name := aString
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> node [
	^ lexiconFile findDefinitionNode: name
]
