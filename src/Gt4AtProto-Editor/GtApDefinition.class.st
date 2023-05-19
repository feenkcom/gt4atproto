Class {
	#name : #GtApDefinition,
	#superclass : #Object,
	#instVars : [
		'lexiconFile',
		'name'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApDefinition >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #accessing }
GtApDefinition >> gtSourceFor: aView [
	<gtView>
	| editor |
	^ aView explicit
		title: 'Source';
		stencil: [ editor := lexiconFile editor.
			editor
				enqueueTask: [ editor editor
						moveCursorTo: self node value startPosition - 1;
						select: self node value startPosition - 1
							to: self node value stopPosition.
					self node gtScrollToPosition: self node value stopPosition inEditor: editor ]
						asBlTask.
			editor ];
		actionButtonIcon: BrGlamorousVectorIcons accept
			tooltip: 'Save'
			action: [ lexiconFile
					source: editor editor text asString;
					saveFile ]
]

{ #category : #accessing }
GtApDefinition >> id [
	^ lexiconFile id ifNotNil: [ :id | id , '#' , name ]
]

{ #category : #accessing }
GtApDefinition >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApDefinition >> lexiconFile: aGtApLexiconFile [
	lexiconFile := aGtApLexiconFile
]

{ #category : #accessing }
GtApDefinition >> name [
	^ name
]

{ #category : #accessing }
GtApDefinition >> name: aString [
	name := aString
]

{ #category : #accessing }
GtApDefinition >> node [
	^ lexiconFile findDefinitionNode: name
]
